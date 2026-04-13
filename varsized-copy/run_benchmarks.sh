#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# =============================================================================
# Configuration
# =============================================================================

THREADS=(2 4 8 16 32 48 64)
NUM_ITERATIONS=1
DOCKER_NETWORK="mynet"
WORKER_NAME="worker-max"
WORKER_HOST="$WORKER_NAME:8080"
DATA_VOLUME="/data/users/maxim/large:/work/large:ro"
OPERATOR_BUFFER_SIZE=262144

# Suite definitions (nebuli API)
declare -A SUITE_WORKER_IMAGE
declare -A SUITE_CLI_IMAGE
declare -A SUITE_STATUS_CLI_IMAGE
declare -A SUITE_QUERIES_DIR

SUITE_WORKER_IMAGE[baseline]="nebulastream/worker:maxim-popov-baseline-varsized-memcpy"
SUITE_CLI_IMAGE[baseline]="nebulastream/nebuli:maxim-popov-baseline-varsized-memcpy"
SUITE_STATUS_CLI_IMAGE[baseline]="nebulastream/nebuli:maxim-popov-baseline-varsized-memcpy"
SUITE_QUERIES_DIR[baseline]="$SCRIPT_DIR/queries"

SUITE_WORKER_IMAGE[optimized]="nebulastream/worker:maxim-popov-remove-memcpy-bench"
SUITE_CLI_IMAGE[optimized]="nebulastream/nebuli:maxim-popov-remove-memcpy-bench"
SUITE_STATUS_CLI_IMAGE[optimized]="nebulastream/nebuli:maxim-popov-remove-memcpy-bench"
SUITE_QUERIES_DIR[optimized]="$SCRIPT_DIR/queries"

SUITE_WORKER_IMAGE[baseline-json]="nebulastream/worker:maxim-popov-baseline-varsized-memcpy"
SUITE_CLI_IMAGE[baseline-json]="nebulastream/nebuli:maxim-popov-baseline-varsized-memcpy"
SUITE_STATUS_CLI_IMAGE[baseline-json]="nebulastream/nebuli:maxim-popov-baseline-varsized-memcpy"
SUITE_QUERIES_DIR[baseline-json]="$SCRIPT_DIR/queries-json"

SUITE_WORKER_IMAGE[optimized-json]="nebulastream/worker:maxim-popov-remove-memcpy-bench"
SUITE_CLI_IMAGE[optimized-json]="nebulastream/nebuli:maxim-popov-remove-memcpy-bench"
SUITE_STATUS_CLI_IMAGE[optimized-json]="nebulastream/nebuli:maxim-popov-remove-memcpy-bench"
SUITE_QUERIES_DIR[optimized-json]="$SCRIPT_DIR/queries-json"

ALL_SUITES=(baseline optimized baseline-json optimized-json)

# =============================================================================
# Helpers
# =============================================================================

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"
}

die() {
    log "ERROR: $*" >&2
    exit 1
}

usage() {
    cat <<EOF
Usage: $(basename "$0") [OPTIONS] [SUITE...]

Run varsized-copy benchmarks for one or more suites.
Uses the nebuli API (blocking submit, YAML query files).

Suites: ${ALL_SUITES[*]}
If no suite is specified, all suites are run.

Options:
  -t, --threads LIST       Comma-separated thread counts (default: 2,4,8,16,32,48,64)
  -n, --iterations NUM     Number of iterations per query (default: 1)
  -o, --output DIR         Output directory for results (default: SCRIPT_DIR/results)
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
        "--worker.default_query_execution.operator_buffer_size=$OPERATOR_BUFFER_SIZE"
}

kill_worker() {
    sudo docker kill "$WORKER_NAME" 2>/dev/null || true
    sudo docker wait "$WORKER_NAME" 2>/dev/null || true
}

# Submit query (blocking — returns query_id when the query finishes)
submit_query() {
    local suite="$1" query_file="$2"
    local image="${SUITE_CLI_IMAGE[$suite]}"

    local query_id
    query_id=$(sudo docker run --network "$DOCKER_NETWORK" \
        -v "$SCRIPT_DIR:/work/:ro" \
        "$image" \
        -s "$WORKER_HOST" -w register -i "/work/$query_file" -x)
    echo "$query_id"
}

# Get status for a specific query_id (returns single JSON object)
query_status() {
    local suite="$1" query_id="$2"
    local image="${SUITE_STATUS_CLI_IMAGE[$suite]}"

    sudo docker run --network "$DOCKER_NETWORK" \
        -v "$SCRIPT_DIR/topology.yaml:/work/topology.yaml:ro" \
        -v "$SCRIPT_DIR/queries:/work/queries:ro" \
        "$image" \
        -s "$WORKER_HOST" status "$query_id"
}

# --- Results management ------------------------------------------------------

init_results_file() {
    local file="$1"
    echo "[]" > "$file"
}

add_result() {
    local file="$1" query_file="$2" query_id="$3" threads="$4"
    local state="$5" start_time_ms="$6" stop_time_ms="$7"

    local temp
    temp=$(mktemp)
    jq --arg query_file "$query_file" \
       --argjson qid "$query_id" \
       --argjson threads "$threads" \
       --arg state "$state" \
       --argjson start_time_ms "$start_time_ms" \
       --argjson stop_time_ms "$stop_time_ms" \
       '. += [{
           query_file: $query_file,
           query_id: $qid,
           threads_number: $threads,
           state: $state,
           start_time_ms: $start_time_ms,
           stop_time_ms: $stop_time_ms
       }]' "$file" > "$temp"
    mv "$temp" "$file"
}

# =============================================================================
# Benchmark runner
# =============================================================================

run_suite() {
    local suite="$1"
    local timestamp results_file
    timestamp=$(date +%s)
    results_file="$OUTPUT_DIR/${suite}_results_${timestamp}.json"

    log "========================================="
    log "Starting suite: $suite"
    log "Results file: $results_file"
    log "========================================="

    init_results_file "$results_file"

    # Discover query files for this suite
    local queries_dir="${SUITE_QUERIES_DIR[$suite]}"
    local query_files=("$queries_dir"/*.yaml)
    if [[ ! -e "${query_files[0]}" ]]; then
        die "No query YAML files found in $queries_dir/"
    fi
    log "Found ${#query_files[@]} query file(s):"
    for f in "${query_files[@]}"; do
        log "  - $f"
    done

    # Ensure no leftover worker
    kill_worker

    for threads in "${THREADS[@]}"; do
        log "-----------------------------------------"
        log "[$suite] Starting worker with $threads threads"
        log "-----------------------------------------"

        local container_id
        container_id=$(start_worker "$suite" "$threads")
        log "[$suite] Worker started: $container_id"
        sleep 2

        for query_file in "${query_files[@]}"; do
            # Make path relative to SCRIPT_DIR for docker mount
            local rel_path="${query_file#"$SCRIPT_DIR/"}"

            for iteration in $(seq 1 "$NUM_ITERATIONS"); do
                log "[$suite] Submitting: $rel_path (iter $iteration/$NUM_ITERATIONS)"

                # Blocking submit — returns when query completes
                local query_id
                query_id=$(submit_query "$suite" "$rel_path")

                log "[$suite] Query $query_id finished, fetching status..."

                local status_output
                status_output=$(query_status "$suite" "$query_id")

                local state start_time_ms stop_time_ms
                state=$(echo "$status_output" | jq -r '.state')
                start_time_ms=$(echo "$status_output" | jq -r '.metrics.start_time_ms')
                stop_time_ms=$(echo "$status_output" | jq -r '.metrics.stop_time_ms')

                log "[$suite] Query $query_id completed with state: $state"

                add_result "$results_file" "$rel_path" "$query_id" "$threads" \
                           "$state" "$start_time_ms" "$stop_time_ms"
            done
        done

        log "[$suite] Killing worker"
        kill_worker

        log "[$suite] Completed benchmark for $threads threads"
    done

    log "========================================="
    log "Suite $suite complete! Results: $results_file"
    log "========================================="

    log "Summary:"
    jq -r '.[] | "  Query: \(.query_file) | ID: \(.query_id) | Threads: \(.threads_number) | State: \(.state)"' "$results_file"
}

# =============================================================================
# Argument parsing
# =============================================================================

OUTPUT_DIR="$SCRIPT_DIR/results"
SUITES_TO_RUN=()

while (( $# > 0 )); do
    case "$1" in
        -t|--threads)
            IFS=',' read -ra THREADS <<< "$2"
            shift 2
            ;;
        -n|--iterations)
            NUM_ITERATIONS="$2"
            shift 2
            ;;
        -o|--output)
            OUTPUT_DIR="$2"
            shift 2
            ;;
        -h|--help)
            usage
            ;;
        -*)
            die "Unknown option: $1"
            ;;
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
log "Output dir:     $OUTPUT_DIR"

for suite in "${SUITES_TO_RUN[@]}"; do
    run_suite "$suite"
done

log "All benchmarks complete!"
