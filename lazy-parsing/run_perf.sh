#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# =============================================================================
# Configuration (mirrors run_benchmarks.sh)
# =============================================================================

THREADS=(2 4 8 16 32 64)
QUERIES_FILE="$SCRIPT_DIR/queries.txt"
POLL_INTERVAL=2
TIMEOUT=600
DOCKER_NETWORK="mynet"
WORKER_NAME="worker-max"
WORKER_HOST="$WORKER_NAME:8080"
DATA_VOLUME="/data/users/maxim/large:/work/large:ro"
OPERATOR_BUFFER_SIZE=262144
NUM_ITERATIONS=1
PERF_FREQ=99

# Suite definitions
declare -A SUITE_WORKER_IMAGE
declare -A SUITE_CLI_IMAGE
declare -A SUITE_STATUS_CLI_IMAGE
declare -A SUITE_TOPOLOGY

SUITE_WORKER_IMAGE[baseline]="nebulastream/worker:maxim-popov-master-baseline"
SUITE_CLI_IMAGE[baseline]="nebulastream/nes-cli:maxim-popov-master-baseline"
SUITE_STATUS_CLI_IMAGE[baseline]="nebulastream/nes-cli:maxim-popov-lazy-parsing"
SUITE_TOPOLOGY[baseline]="$SCRIPT_DIR/topology-csv.yaml"

SUITE_WORKER_IMAGE[optimized]="nebulastream/worker:maxim-popov-lazy-parsing"
SUITE_CLI_IMAGE[optimized]="nebulastream/nes-cli:maxim-popov-lazy-parsing"
SUITE_STATUS_CLI_IMAGE[optimized]="nebulastream/nes-cli:maxim-popov-lazy-parsing"
SUITE_TOPOLOGY[optimized]="$SCRIPT_DIR/topology-csv.yaml"

SUITE_WORKER_IMAGE[baseline-json]="nebulastream/worker:maxim-popov-master-baseline"
SUITE_CLI_IMAGE[baseline-json]="nebulastream/nes-cli:maxim-popov-master-baseline"
SUITE_STATUS_CLI_IMAGE[baseline-json]="nebulastream/nes-cli:maxim-popov-lazy-parsing"
SUITE_TOPOLOGY[baseline-json]="$SCRIPT_DIR/topology-json.yaml"

SUITE_WORKER_IMAGE[optimized-json]="nebulastream/worker:maxim-popov-lazy-parsing"
SUITE_CLI_IMAGE[optimized-json]="nebulastream/nes-cli:maxim-popov-lazy-parsing"
SUITE_STATUS_CLI_IMAGE[optimized-json]="nebulastream/nes-cli:maxim-popov-lazy-parsing"
SUITE_TOPOLOGY[optimized-json]="$SCRIPT_DIR/topology-json.yaml"

ALL_SUITES=(baseline optimized baseline-json optimized-json)

# =============================================================================
# Helpers
# =============================================================================

log() { echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"; }
die() { log "ERROR: $*" >&2; exit 1; }

usage() {
    cat <<EOF
Usage: $(basename "$0") [OPTIONS] [SUITE...]

Run perf profiling for lazy-parsing benchmarks.

Suites: ${ALL_SUITES[*]}
If no suite is specified, all suites are run.

Options:
  -t, --threads LIST   Comma-separated thread counts (default: ${THREADS[*]})
  -n, --iterations NUM Number of iterations per query (default: $NUM_ITERATIONS)
  -q, --queries FILE   Path to queries file (default: queries.txt)
  -o, --output  DIR    Output directory for results (default: SCRIPT_DIR/perf_results)
  -F, --freq NUM       Perf sampling frequency in Hz (default: $PERF_FREQ)
  -h, --help           Show this help message
EOF
    exit 0
}

sanitize_name() {
    echo "$1" | tr -c 'a-zA-Z0-9_-' '_' | sed 's/_\+/_/g' | sed 's/^_//;s/_$//' | head -c 80
}

# --- Docker wrappers ---------------------------------------------------------

start_worker() {
    local suite="$1" threads="$2"
    local image="${SUITE_WORKER_IMAGE[$suite]}"

    sudo docker run --rm --network "$DOCKER_NETWORK" --cpus 64 \
        --name "$WORKER_NAME" \
        -v "$DATA_VOLUME" \
        -d "$image" \
        "--worker.query_engine.number_of_worker_threads=$threads" \
        "--worker.default_query_execution.operator_buffer_size=$OPERATOR_BUFFER_SIZE"
}

kill_worker() {
    sudo docker kill "$WORKER_NAME" 2>/dev/null || true
    sudo docker wait "$WORKER_NAME" 2>/dev/null || true
}

get_container_pid() {
    sudo docker inspect --format '{{.State.Pid}}' "$WORKER_NAME"
}

submit_query() {
    local suite="$1" query="$2" log_file="$3"
    local image="${SUITE_CLI_IMAGE[$suite]}"
    local topology="${SUITE_TOPOLOGY[$suite]}"

    sudo docker run --network "$DOCKER_NETWORK" \
        -v "$topology:/work/topology.yaml:ro" \
        "$image" \
        -t /work/topology.yaml \
        -s "$WORKER_HOST" -d start "$query" 2>>"$log_file"
}

query_status() {
    local suite="$1" log_file="$2"
    local image="${SUITE_STATUS_CLI_IMAGE[$suite]}"
    local topology="${SUITE_TOPOLOGY[$suite]}"

    sudo docker run --network "$DOCKER_NETWORK" \
        -v "$topology:/work/topology.yaml:ro" \
        "$image" \
        -t /work/topology.yaml \
        -s "$WORKER_HOST" status 2>>"$log_file"
}

# --- Perf helpers ------------------------------------------------------------

start_perf() {
    local pid="$1" output_file="$2"
    sudo perf record -g --call-graph dwarf -F "$PERF_FREQ" -p "$pid" -o "$output_file" &
    PERF_PID=$!
    log "Started perf recording (PID: $PERF_PID) -> $output_file"
}

stop_perf() {
    local data_file="$1" report_file="$2"

    if [[ -n "${PERF_PID:-}" ]] && kill -0 "$PERF_PID" 2>/dev/null; then
        kill -INT "$PERF_PID"
        wait "$PERF_PID" 2>/dev/null || true
        sleep 1
        log "Stopped perf recording"
    fi

    if [[ -f "$data_file" ]]; then
        sudo perf report -i "$data_file" --stdio --no-children > "$report_file" 2>&1 || true
        log "Generated perf report: $report_file"
    else
        log "WARNING: perf data file not found: $data_file"
    fi
    PERF_PID=""
}

# --- Polling -----------------------------------------------------------------

poll_query_status() {
    local suite="$1" query_id="$2" log_file="$3"
    local start_time elapsed current_time
    start_time=$(date +%s)

    log "Polling status for query $query_id..." >&2

    while true; do
        current_time=$(date +%s)
        elapsed=$((current_time - start_time))

        if (( elapsed >= TIMEOUT )); then
            log "Query $query_id timed out after ${TIMEOUT}s" >&2
            echo "TimedOut"
            return 0
        fi

        local status_output
        status_output=$(query_status "$suite" "$log_file")

        local query_info
        query_info=$(echo "$status_output" | jq ".[] | select(.local_query_id == $query_id)")

        if [[ -z "$query_info" ]]; then
            sleep "$POLL_INTERVAL"
            continue
        fi

        local stopped
        stopped=$(echo "$query_info" | jq -r '.stopped')

        if [[ "$stopped" != "null" && -n "$stopped" ]]; then
            local q_status
            q_status=$(echo "$query_info" | jq -r '.query_status')
            echo "$q_status"
            return 0
        fi

        sleep "$POLL_INTERVAL"
    done
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

        local query_num=0
        while IFS= read -r query || [[ -n "$query" ]]; do
            [[ -z "$query" ]] && continue
            query_num=$((query_num + 1))

            local sanitized
            sanitized=$(sanitize_name "$query")

            for iteration in $(seq 1 "$NUM_ITERATIONS"); do
                local tag="${threads}t_q${query_num}_${sanitized}_iter${iteration}"
                local perf_data="${perf_dir}/${tag}.perf.data"
                local perf_report="${perf_dir}/${tag}.perf.report"

                log "[$suite] Submitting query: $query (iter $iteration/$NUM_ITERATIONS)"

                start_perf "$worker_pid" "$perf_data"

                local submit_output query_id
                submit_output=$(submit_query "$suite" "$query" "$cli_log")
                query_id=$(echo "$submit_output" | tail -n 1)
                log "[$suite] Query submitted with ID: $query_id"

                local status
                status=$(poll_query_status "$suite" "$query_id" "$cli_log")
                log "[$suite] Query $query_id completed: $status"

                stop_perf "$perf_data" "$perf_report"
            done

        done < "$QUERIES_FILE"

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
        -q|--queries)   QUERIES_FILE="$2"; shift 2 ;;
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

[[ -f "$QUERIES_FILE" ]] || die "Queries file not found: $QUERIES_FILE"
mkdir -p "$OUTPUT_DIR"

log "Suites to run:  ${SUITES_TO_RUN[*]}"
log "Thread counts:  ${THREADS[*]}"
log "Iterations:     $NUM_ITERATIONS"
log "Perf frequency: $PERF_FREQ Hz"
log "Queries file:   $QUERIES_FILE"
log "Output dir:     $OUTPUT_DIR"

for suite in "${SUITES_TO_RUN[@]}"; do
    run_suite "$suite"
done

log "All perf profiling complete!"
