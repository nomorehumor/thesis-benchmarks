#!/bin/bash

set -e

# Configuration (matches run_benchmark.sh)
THREADS_NUMBERS=(4 8 16 32 64)
BUFFER_SIZES=(4096 8192 16384 32768 65536 131072 262144 524288 1048576)
QUERIES_FILE="queries.txt"
TIMESTAMP=$(date +%s)
PERF_RESULTS_DIR="perf_results_${TIMESTAMP}"
POLL_INTERVAL=2
NUM_ITERATIONS=1

# Parse arguments
while getopts "n:" opt; do
    case $opt in
        n) NUM_ITERATIONS=$OPTARG ;;
        \?) echo "Usage: $0 [-n num_iterations]" >&2; exit 1 ;;
    esac
done

mkdir -p "$PERF_RESULTS_DIR"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"
}

sanitize_name() {
    echo "$1" | tr -c 'a-zA-Z0-9_-' '_' | sed 's/_\+/_/g' | sed 's/^_//;s/_$//' | head -c 80
}

get_container_pid() {
    sudo docker inspect --format '{{.State.Pid}}' worker-max
}

start_worker() {
    local threads="$1" buffer_size="$2"
    sudo docker run --rm --network mynet --cpus 64 --name worker-max \
        -v "/data/users/maxim/large:/work/large:ro" \
        -d nebulastream/worker:maxim-popov-master-baseline \
        "--worker.query_engine.number_of_worker_threads=$threads" \
        "--worker.default_query_execution.operator_buffer_size=$buffer_size" \
        "--worker.dump_compilation_result=FILE"
}

save_compilation_dump() {
    local dest_dir="$1"
    local newest
    newest=$(sudo docker exec worker-max sh -c 'ls -td /tmp/dump/*/ 2>/dev/null | head -n1') || true
    if [ -n "$newest" ]; then
        mkdir -p "$dest_dir"
        sudo docker cp "worker-max:$newest" "$dest_dir/" 2>/dev/null || true
        log "Saved compilation dump from $newest to $dest_dir/"
    else
        log "WARNING: No compilation dump found in container /tmp/dump/"
    fi
}

start_perf() {
    local pid="$1"
    local output_file="$2"
    PERF_RECORD_PID=$(sudo sh -c "perf record -F 99 -p $pid -o '$output_file' </dev/null >/dev/null 2>&1 & echo \$!")
    log "Started perf recording (PID: $PERF_RECORD_PID) -> $output_file"
}

stop_perf() {
    local data_file="$1"
    local report_file="$2"

    if [ -n "${PERF_RECORD_PID:-}" ] && sudo kill -0 "$PERF_RECORD_PID" 2>/dev/null; then
        sudo kill -INT "$PERF_RECORD_PID"
        while sudo kill -0 "$PERF_RECORD_PID" 2>/dev/null; do
            sleep 0.5
        done
        sleep 1
        log "Stopped perf recording"
    fi

    if [ -f "$data_file" ]; then
        # Canonical text dump of every sample (input for stackcollapse-perf.pl
        # and the standard FlameGraph pipeline). Run while the container is
        # alive so symbols resolve via /proc/<pid>/root/.
        local script_file="${data_file%.data}"
        sudo perf script -i "$data_file" > "$script_file" 2>/dev/null || true
        log "Generated perf script: $script_file"

        sudo perf report -i "$data_file" --stdio --no-children > "$report_file" 2>&1 || true
        log "Generated perf report: $report_file"
        archive_perf_data "$data_file"
    else
        log "WARNING: perf data file not found: $data_file"
    fi
    PERF_RECORD_PID=""
}

# Bundle DSOs needed to symbolicate this .perf.data on another host.
# Seeds the host buildid-cache from the live container's rootfs
# (/proc/<container_pid>/root/...) before running perf archive, so the
# resulting <data_file>.tar.bz2 actually contains the referenced binaries.
archive_perf_data() {
    local data_file="$1"
    [ -f "$data_file" ] || return 0

    local container_pid
    container_pid=$(get_container_pid 2>/dev/null || true)
    if [ -n "$container_pid" ] && [ -r "/proc/$container_pid/root" ]; then
        while IFS= read -r dso; do
            [ -z "$dso" ] && continue
            [ "${dso:0:1}" != "/" ] && continue
            local src="/proc/$container_pid/root$dso"
            if [ -e "$src" ]; then
                sudo perf buildid-cache --add "$src" 2>/dev/null || true
            fi
        done < <(sudo perf buildid-list -i "$data_file" 2>/dev/null | awk '{print $2}')
    fi

    ( cd "$(dirname "$data_file")" && sudo perf archive "$(basename "$data_file")" ) >/dev/null 2>&1 || true
    if [ -f "${data_file}.tar.bz2" ]; then
        log "Archived symbols: ${data_file}.tar.bz2"
    else
        log "WARNING: perf archive produced no tarball for $data_file"
    fi
}

poll_query_status() {
    local query_id="$1"
    local timeout=300
    local elapsed=0

    log "Polling status for query $query_id (timeout: ${timeout}s)..." >&2

    while [ "$elapsed" -lt "$timeout" ]; do
        local status_output=$(./query_status.sh)
        local query_info=$(echo "$status_output" | jq ".[] | select(.local_query_id == $query_id)")

        if [ -z "$query_info" ]; then
            log "Query $query_id not found in status, waiting..." >&2
            sleep "$POLL_INTERVAL"
            elapsed=$((elapsed + POLL_INTERVAL))
            continue
        fi

        local stopped=$(echo "$query_info" | jq -r '.stopped')

        if [ "$stopped" != "null" ] && [ -n "$stopped" ]; then
            log "Query $query_id has stopped" >&2
            local status=$(echo "$query_info" | jq -r '.query_status')
            echo "$status"
            return 0
        fi

        log "Query $query_id still running, waiting..." >&2
        sleep "$POLL_INTERVAL"
        elapsed=$((elapsed + POLL_INTERVAL))
    done

    log "Query $query_id timed out after ${timeout}s" >&2
    echo "TIMEOUT"
    return 0
}

# Main
log "Starting perf profiling with timestamp: $TIMESTAMP"
log "Number of iterations per query: $NUM_ITERATIONS"
log "Results will be saved to: $PERF_RESULTS_DIR/"

# Kill any existing worker
log "Killing any existing worker..."
./kill_worker.sh || true

for threads in "${THREADS_NUMBERS[@]}"; do
    for buffer_size in "${BUFFER_SIZES[@]}"; do
        log "========================================="
        log "Profiling with $threads threads, buffer size $buffer_size"
        log "========================================="

        query_num=0
        while IFS= read -r query || [ -n "$query" ]; do
            [ -z "$query" ] && continue
            query_num=$((query_num + 1))

            sanitized=$(sanitize_name "$query")

            for iteration in $(seq 1 $NUM_ITERATIONS); do
                perf_data="${PERF_RESULTS_DIR}/${threads}t_buf${buffer_size}_q${query_num}_${sanitized}_iter${iteration}.perf.data"
                perf_report="${PERF_RESULTS_DIR}/${threads}t_buf${buffer_size}_q${query_num}_${sanitized}_iter${iteration}.perf.report"

                # Start worker (new worker per iteration)
                worker_container_id=$(start_worker "$threads" "$buffer_size")
                log "Worker started with container ID: $worker_container_id"
                sleep 2

                WORKER_PID=$(get_container_pid)
                log "Worker PID on host: $WORKER_PID"

                log "Submitting query: $query (iteration $iteration/$NUM_ITERATIONS)"

                start_perf "$WORKER_PID" "$perf_data"

                submit_output=$(./submit_query.sh "$query")
                query_id=$(echo "$submit_output" | tail -n 1)
                log "Query submitted with ID: $query_id"

                status=$(poll_query_status "$query_id")
                log "Query $query_id completed with status: $status"

                save_compilation_dump "${PERF_RESULTS_DIR}/${threads}t_buf${buffer_size}_q${query_num}_${sanitized}_iter${iteration}_compilation"

                stop_perf "$perf_data" "$perf_report"

                # Kill worker
                log "Killing worker..."
                ./kill_worker.sh || true
            done

        done < "$QUERIES_FILE"

        log "Completed profiling for $threads threads, buffer size $buffer_size"
    done
done

log "========================================="
log "Perf profiling complete!"
log "Results saved to: $PERF_RESULTS_DIR/"
log "========================================="
