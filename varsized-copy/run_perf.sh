#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# =============================================================================
# Configuration (mirrors run_benchmarks.sh)
# =============================================================================

THREADS=(1)
DOCKER_NETWORK="mynet"
WORKER_NAME="worker-max"
WORKER_HOST="$WORKER_NAME:8080"
DATA_VOLUME="/data/users/maxim/large:/work/large:ro"
OPERATOR_BUFFER_SIZE=262144
NUM_ITERATIONS=1
PERF_FREQ=99

# Suite definitions (nebuli API)
declare -A SUITE_WORKER_IMAGE
declare -A SUITE_CLI_IMAGE
declare -A SUITE_STATUS_CLI_IMAGE
declare -A SUITE_QUERIES_DIR

SUITE_WORKER_IMAGE[baseline]="nebulastream/worker:maxim-popov-nebuli-update"
SUITE_CLI_IMAGE[baseline]="nebulastream/nebuli:maxim-popov-nebuli-update"
SUITE_STATUS_CLI_IMAGE[baseline]="nebulastream/nebuli:maxim-popov-nebuli-update"
SUITE_QUERIES_DIR[baseline]="$SCRIPT_DIR/queries"

SUITE_WORKER_IMAGE[optimized]="nebulastream/worker:maxim-popov-remove-memcpy-bench"
SUITE_CLI_IMAGE[optimized]="nebulastream/nebuli:maxim-popov-remove-memcpy-bench"
SUITE_STATUS_CLI_IMAGE[optimized]="nebulastream/nebuli:maxim-popov-remove-memcpy-bench"
SUITE_QUERIES_DIR[optimized]="$SCRIPT_DIR/queries"

SUITE_WORKER_IMAGE[baseline-json]="nebulastream/worker:maxim-popov-nebuli-update"
SUITE_CLI_IMAGE[baseline-json]="nebulastream/nebuli:maxim-popov-nebuli-update"
SUITE_STATUS_CLI_IMAGE[baseline-json]="nebulastream/nebuli:maxim-popov-nebuli-update"
SUITE_QUERIES_DIR[baseline-json]="$SCRIPT_DIR/queries-json"

SUITE_WORKER_IMAGE[optimized-json]="nebulastream/worker:maxim-popov-remove-memcpy-bench"
SUITE_CLI_IMAGE[optimized-json]="nebulastream/nebuli:maxim-popov-remove-memcpy-bench"
SUITE_STATUS_CLI_IMAGE[optimized-json]="nebulastream/nebuli:maxim-popov-remove-memcpy-bench"
SUITE_QUERIES_DIR[optimized-json]="$SCRIPT_DIR/queries-json"

ALL_SUITES=(baseline optimized baseline-json optimized-json)

# =============================================================================
# Helpers
# =============================================================================

log() { echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"; }
die() { log "ERROR: $*" >&2; exit 1; }

usage() {
    cat <<EOF
Usage: $(basename "$0") [OPTIONS] [SUITE...]

Run perf profiling for varsized-copy benchmarks.
Uses the nebuli API (blocking submit, YAML query files).

Suites: ${ALL_SUITES[*]}
If no suite is specified, all suites are run.

Options:
  -t, --threads LIST       Comma-separated thread counts (default: ${THREADS[*]})
  -n, --iterations NUM     Number of iterations per query (default: $NUM_ITERATIONS)
  -o, --output DIR         Output directory for results (default: SCRIPT_DIR/perf_results)
  -F, --freq NUM           Perf sampling frequency in Hz (default: $PERF_FREQ)
  -h, --help               Show this help message
EOF
    exit 0
}

# --- Docker wrappers ---------------------------------------------------------

start_worker() {
    local suite="$1" threads="$2"
    local image="${SUITE_WORKER_IMAGE[$suite]}"

    sudo docker run --rm --network "$DOCKER_NETWORK" --cpus 64 \
        --name "$WORKER_NAME" \
        -v "$DATA_VOLUME" \
        -p 8080:8080 \
        -d "$image" \
        "--grpc=$WORKER_HOST" \
        "--worker.query_engine.number_of_worker_threads=$threads" \
        "--worker.default_query_execution.operator_buffer_size=$OPERATOR_BUFFER_SIZE" \
        "--worker.dump_compilation_result=FILE" 
}

kill_worker() {
    sudo docker kill "$WORKER_NAME" 2>/dev/null || true
    sudo docker wait "$WORKER_NAME" 2>/dev/null || true
}

get_container_pid() {
    sudo docker inspect --format '{{.State.Pid}}' "$WORKER_NAME"
}

save_compilation_dump() {
    local dest_dir="$1"
    local newest
    newest=$(sudo docker exec "$WORKER_NAME" sh -c 'ls -td /tmp/dump/*/ 2>/dev/null | head -n1') || true
    if [[ -n "$newest" ]]; then
        mkdir -p "$dest_dir"
        sudo docker cp "$WORKER_NAME:$newest" "$dest_dir/" 2>/dev/null || true
        log "Saved compilation dump from $newest to $dest_dir/"
    else
        log "WARNING: No compilation dump found in container /tmp/dump/"
    fi
}

# Blocking submit — returns query_id when the query finishes
submit_query() {
    local suite="$1" query_file="$2" log_file="$3"
    local image="${SUITE_CLI_IMAGE[$suite]}"

    sudo docker run --network "$DOCKER_NETWORK" \
        -v "$SCRIPT_DIR:/work/:ro" \
        "$image" \
        -s "$WORKER_HOST" -w register -i "/work/$query_file" -x 2>>"$log_file"
}

query_status() {
    local suite="$1" query_id="$2" log_file="$3"
    local image="${SUITE_STATUS_CLI_IMAGE[$suite]}"

    sudo docker run --network "$DOCKER_NETWORK" \
        -v "$SCRIPT_DIR/topology.yaml:/work/topology.yaml:ro" \
        -v "$SCRIPT_DIR/queries:/work/queries:ro" \
        "$image" \
        -s "$WORKER_HOST" status "$query_id" 
}

# --- Perf helpers ------------------------------------------------------------

start_perf() {
    local pid="$1" output_file="$2"
    PERF_RECORD_PID=$(sudo sh -c "perf record --call-graph fp --sample-cpu -g -F $PERF_FREQ -p $pid -o '$output_file' </dev/null >/dev/null 2>&1 & echo \$!")
    log "Started perf recording (PID: $PERF_RECORD_PID) -> $output_file"
}

stop_perf() {
    local data_file="$1" report_file="$2"

    if [[ -n "${PERF_RECORD_PID:-}" ]] && sudo kill -0 "$PERF_RECORD_PID" 2>/dev/null; then
        sudo kill -INT "$PERF_RECORD_PID"
        while sudo kill -0 "$PERF_RECORD_PID" 2>/dev/null; do
            sleep 0.5
        done
        sleep 1
        log "Stopped perf recording"
    fi

    if [[ -f "$data_file" ]]; then
        sudo perf report -i "$data_file" --stdio --no-children --call-graph folded,0,callee,function > "$report_file" 2>&1 || true
        log "Generated perf report: $report_file"
    else
        log "WARNING: perf data file not found: $data_file"
    fi
    PERF_RECORD_PID=""
}

# =============================================================================
# Perf profiling runner
# =============================================================================

run_suite() {
    local suite="$1"
    local timestamp perf_dir log_dir
    timestamp=$(date +%s)
    perf_dir="$OUTPUT_DIR/${suite}_${timestamp}"
    log_dir="$OUTPUT_DIR/logs/${suite}_${timestamp}"
    mkdir -p "$perf_dir" "$log_dir"

    log "========================================="
    log "Starting perf profiling for suite: $suite"
    log "Perf output: $perf_dir"
    log "========================================="

    # Discover query files
    local queries_dir="${SUITE_QUERIES_DIR[$suite]}"
    local query_files=("$queries_dir"/*.yaml)
    if [[ ! -e "${query_files[0]}" ]]; then
        die "No query YAML files found in $queries_dir/"
    fi
    log "Found ${#query_files[@]} query file(s):"
    for f in "${query_files[@]}"; do
        log "  - $f"
    done

    kill_worker

    for threads in "${THREADS[@]}"; do
        log "-----------------------------------------"
        log "[$suite] Starting worker with $threads threads"
        log "-----------------------------------------"

        local cli_log="$log_dir/cli_${threads}.log"
        local container_id
        container_id=$(start_worker "$suite" "$threads")
        log "[$suite] Worker started: $container_id"
        sleep 2

        local worker_pid
        worker_pid=$(get_container_pid)
        log "[$suite] Worker PID on host: $worker_pid"

        for query_file in "${query_files[@]}"; do
            local rel_path="${query_file#"$SCRIPT_DIR/"}"
            local query_basename
            query_basename=$(basename "$query_file" .yaml)

            for iteration in $(seq 1 "$NUM_ITERATIONS"); do
                local tag="${threads}t_${query_basename}_iter${iteration}"
                local perf_data="${perf_dir}/${tag}.perf.data"
                local perf_report="${perf_dir}/${tag}.perf.report"

                log "[$suite] Submitting: $rel_path (iter $iteration/$NUM_ITERATIONS)"

                start_perf "$worker_pid" "$perf_data"

                # Blocking submit
                local query_id
                query_id=$(submit_query "$suite" "$rel_path" "$cli_log")
                log "[$suite] Query $query_id finished"

                save_compilation_dump "${perf_dir}/${tag}_compilation"

                # Generate report while container is still alive
                stop_perf "$perf_data" "$perf_report"

                # Log status
                local status_output state
                status_output=$(query_status "$suite" "$query_id" "$cli_log")
                state=$(echo "$status_output" | jq -r '.state')
                log "[$suite] Query $query_id state: $state"
            done
        done

        log "[$suite] Killing worker"
        kill_worker

        log "[$suite] Completed profiling for $threads threads"
    done

    log "========================================="
    log "Suite $suite complete! Perf data: $perf_dir"
    log "========================================="
}

# =============================================================================
# Argument parsing
# =============================================================================

OUTPUT_DIR="$SCRIPT_DIR/perf_results"
SUITES_TO_RUN=()

while (( $# > 0 )); do
    case "$1" in
        -t|--threads)   IFS=',' read -ra THREADS <<< "$2"; shift 2 ;;
        -n|--iterations) NUM_ITERATIONS="$2"; shift 2 ;;
        -o|--output)    OUTPUT_DIR="$2"; shift 2 ;;
        -F|--freq)      PERF_FREQ="$2"; shift 2 ;;
        -h|--help)      usage ;;
        -*)             die "Unknown option: $1" ;;
        *)
            if [[ -z "${SUITE_WORKER_IMAGE[$1]+x}" ]]; then
                die "Unknown suite: $1. Valid suites: ${ALL_SUITES[*]}"
            fi
            SUITES_TO_RUN+=("$1")
            shift
            ;;
    esac
done

if (( ${#SUITES_TO_RUN[@]} == 0 )); then
    SUITES_TO_RUN=("${ALL_SUITES[@]}")
fi

# =============================================================================
# Main
# =============================================================================

mkdir -p "$OUTPUT_DIR"

log "Suites to run:  ${SUITES_TO_RUN[*]}"
log "Thread counts:  ${THREADS[*]}"
log "Iterations:     $NUM_ITERATIONS"
log "Perf frequency: $PERF_FREQ Hz"
log "Output dir:     $OUTPUT_DIR"

for suite in "${SUITES_TO_RUN[@]}"; do
    run_suite "$suite"
done

log "All perf profiling complete!"
