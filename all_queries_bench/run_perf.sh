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

start_perf() {
    local pid="$1"
    local output_file="$2"
    sudo perf record -g --call-graph dwarf -F 99 -p "$pid" -o "$output_file" &
    PERF_PID=$!
    log "Started perf recording (PID: $PERF_PID) -> $output_file"
}

stop_perf() {
    local data_file="$1"
    local report_file="$2"

    if [ -n "$PERF_PID" ] && kill -0 "$PERF_PID" 2>/dev/null; then
        kill -INT "$PERF_PID"
        wait "$PERF_PID" 2>/dev/null || true
        log "Stopped perf recording"
    fi

    if [ -f "$data_file" ]; then
        sudo perf report -i "$data_file" --stdio --no-children > "$report_file" 2>/dev/null || true
        log "Generated perf report: $report_file"
    fi
    PERF_PID=""
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
                worker_container_id=$(./start_worker.sh "$threads" "$buffer_size")
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
