#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# =============================================================================
# Configuration
# =============================================================================

THREADS=(2 4 8 16 32 64)
QUERIES_FILE="$SCRIPT_DIR/queries.txt"
POLL_INTERVAL=2      # seconds between status checks
TIMEOUT=600          # 10 minutes per query
DOCKER_NETWORK="mynet"
WORKER_NAME="worker-max"
WORKER_HOST="$WORKER_NAME:8080"
DATA_VOLUME="/data/users/maxim/large:/work/large:ro"
OPERATOR_BUFFER_SIZE=131072
NUM_ITERATIONS=1

# Suite definitions: VARIANT x FORMAT
# Each suite is defined by: worker_image, cli_image, status_cli_image, extra_worker_volumes, topology_file
declare -A SUITE_WORKER_IMAGE
declare -A SUITE_CLI_IMAGE
declare -A SUITE_STATUS_CLI_IMAGE
declare -A SUITE_EXTRA_VOLUMES
declare -A SUITE_TOPOLOGY

SUITE_WORKER_IMAGE[baseline]="nebulastream/worker:maxim-popov-master-baseline"
SUITE_CLI_IMAGE[baseline]="nebulastream/nes-cli:maxim-popov-master-baseline"
SUITE_STATUS_CLI_IMAGE[baseline]="nebulastream/nes-cli:maxim-popov-lazy-parsing"
SUITE_EXTRA_VOLUMES[baseline]=""
SUITE_TOPOLOGY[baseline]="$SCRIPT_DIR/topology-csv.yaml"

SUITE_WORKER_IMAGE[optimized]="nebulastream/worker:maxim-popov-raw-data-comparison"
SUITE_CLI_IMAGE[optimized]="nebulastream/nes-cli:maxim-popov-raw-data-comparison"
SUITE_STATUS_CLI_IMAGE[optimized]="nebulastream/nes-cli:maxim-popov-raw-data-comparison"
SUITE_EXTRA_VOLUMES[optimized]="-v $SCRIPT_DIR/tmp:/tmp"
SUITE_TOPOLOGY[optimized]="$SCRIPT_DIR/topology-csv.yaml"

SUITE_WORKER_IMAGE[baseline-json]="nebulastream/worker:maxim-popov-master-baseline"
SUITE_CLI_IMAGE[baseline-json]="nebulastream/nes-cli:maxim-popov-master-baseline"
SUITE_STATUS_CLI_IMAGE[baseline-json]="nebulastream/nes-cli:maxim-popov-lazy-parsing"
SUITE_EXTRA_VOLUMES[baseline-json]=""
SUITE_TOPOLOGY[baseline-json]="$SCRIPT_DIR/topology-json.yaml"

SUITE_WORKER_IMAGE[optimized-json]="nebulastream/worker:maxim-popov-raw-data-comparison"
SUITE_CLI_IMAGE[optimized-json]="nebulastream/nes-cli:maxim-popov-raw-data-comparison"
SUITE_STATUS_CLI_IMAGE[optimized-json]="nebulastream/nes-cli:maxim-popov-raw-data-comparison"
SUITE_EXTRA_VOLUMES[optimized-json]="-v $SCRIPT_DIR/tmp:/tmp"
SUITE_TOPOLOGY[optimized-json]="$SCRIPT_DIR/topology-json.yaml"

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

Run NebulaStream benchmarks for one or more suites.

Suites: ${ALL_SUITES[*]}
If no suite is specified, all suites are run.

Options:
  -t, --threads LIST   Comma-separated thread counts (default: 2,4,8,16,32,64)
  -n, --iterations NUM Number of iterations per query (default: 1)
  -q, --queries FILE   Path to queries file (default: queries.txt)
  -o, --output  DIR    Output directory for results (default: SCRIPT_DIR/results)
  -h, --help           Show this help message
EOF
    exit 0
}

# --- Docker wrappers ---------------------------------------------------------

start_worker() {
    local suite="$1" threads="$2"
    local image="${SUITE_WORKER_IMAGE[$suite]}"
    local extra="${SUITE_EXTRA_VOLUMES[$suite]}"

    local cmd=(sudo docker run --rm --network "$DOCKER_NETWORK" --cpus 64
        --name "$WORKER_NAME"
        -v "$DATA_VOLUME"
        -d "$image"
        "--worker.query_engine.number_of_worker_threads=$threads"
            "--worker.default_query_execution.operator_buffer_size=$OPERATOR_BUFFER_SIZE")

    # Insert extra volumes before -d if present
    if [[ -n "$extra" ]]; then
        # Rebuild command with extra volumes spliced in before -d
        local cmd2=(sudo docker run --rm --network "$DOCKER_NETWORK"
            --name "$WORKER_NAME"
            -v "$DATA_VOLUME"
            $extra
            -d "$image"
            "--worker.query_engine.number_of_worker_threads=$threads"
            "--worker.default_query_execution.operator_buffer_size=$OPERATOR_BUFFER_SIZE")
        "${cmd2[@]}"
    else
        "${cmd[@]}"
    fi
}

kill_worker() {
    sudo docker kill "$WORKER_NAME" 2>/dev/null || true
    # Wait for container to be fully removed
    sudo docker wait "$WORKER_NAME" 2>/dev/null || true
}

submit_query() {
    local suite="$1" query="$2"
    local image="${SUITE_CLI_IMAGE[$suite]}"
    local topology="${SUITE_TOPOLOGY[$suite]}"

    sudo docker run --network "$DOCKER_NETWORK" \
        -v "$topology:/work/topology.yaml:ro" \
        "$image" \
        -t /work/topology.yaml \
        -s "$WORKER_HOST" -d start "$query"
}

query_status() {
    local suite="$1"
    local image="${SUITE_STATUS_CLI_IMAGE[$suite]}"
    local topology="${SUITE_TOPOLOGY[$suite]}"

    sudo docker run --network "$DOCKER_NETWORK" \
        -v "$topology:/work/topology.yaml:ro" \
        "$image" \
        -t /work/topology.yaml \
        -s "$WORKER_HOST" status
}

# --- Results management ------------------------------------------------------

init_results_file() {
    local file="$1"
    echo "[]" > "$file"
}

add_result() {
    local file="$1" query_text="$2" query_id="$3" threads="$4"
    local status="$5" started="$6" stopped="$7" error="${8:-}"

    local temp
    temp=$(mktemp)
    jq --arg query "$query_text" \
       --arg qid "$query_id" \
       --arg threads "$threads" \
       --arg status "$status" \
       --arg started "$started" \
       --arg stopped "$stopped" \
       --arg error "$error" \
       '. += [{
           query: $query,
           query_id: $qid,
           threads_number: ($threads | tonumber),
           status: $status,
           started: $started,
           stopped: $stopped,
           error: $error
       }]' "$file" > "$temp"
    mv "$temp" "$file"
}

# --- Polling -----------------------------------------------------------------

poll_query_status() {
    local suite="$1" query_id="$2"
    local start_time elapsed current_time
    start_time=$(date +%s)

    log "Polling status for query $query_id..." >&2

    while true; do
        current_time=$(date +%s)
        elapsed=$((current_time - start_time))

        if (( elapsed >= TIMEOUT )); then
            log "Query $query_id timed out after ${TIMEOUT}s" >&2
            echo "TimedOut||$(date '+%Y-%m-%d %H:%M:%S.%6N')|Query polling timed out after ${TIMEOUT} seconds"
            return 0
        fi

        local status_output
        status_output=$(query_status "$suite")

        local query_info
        query_info=$(echo "$status_output" | jq ".[] | select(.local_query_id == $query_id)")

        if [[ -z "$query_info" ]]; then
            log "Query $query_id not found in status, waiting... (${elapsed}s elapsed)" >&2
            sleep "$POLL_INTERVAL"
            continue
        fi

        local stopped
        stopped=$(echo "$query_info" | jq -r '.stopped')

        if [[ "$stopped" != "null" && -n "$stopped" ]]; then
            log "Query $query_id has stopped" >&2
            local q_status q_started q_stopped q_error
            q_status=$(echo "$query_info" | jq -r '.query_status')
            q_started=$(echo "$query_info" | jq -r '.started.formatted')
            q_stopped=$(echo "$query_info" | jq -r '.stopped.formatted')
            q_error=$(echo "$query_info" | jq -r '.error // ""')
            echo "$q_status|$q_started|$q_stopped|$q_error"
            return 0
        fi

        log "Query $query_id still running, waiting... (${elapsed}s elapsed)" >&2
        sleep "$POLL_INTERVAL"
    done
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

    # Ensure no leftover worker
    kill_worker

    for threads in "${THREADS[@]}"; do
        log "-----------------------------------------"
        log "[$suite] Starting worker with $threads threads"
        log "-----------------------------------------"

        local container_id
        container_id=$(start_worker "$suite" "$threads")
        log "[$suite] Worker started: $container_id"

        # Give the worker a moment to initialize
        sleep 2

        while IFS= read -r query || [[ -n "$query" ]]; do
            [[ -z "$query" ]] && continue

            for iteration in $(seq 1 "$NUM_ITERATIONS"); do
                log "[$suite] Submitting query: $query (iter $iteration/$NUM_ITERATIONS)"

                local submit_output query_id
                submit_output=$(submit_query "$suite" "$query")
                query_id=$(echo "$submit_output" | tail -n 1)

                log "[$suite] Query submitted with ID: $query_id"

                local result
                result=$(poll_query_status "$suite" "$query_id")

                local status started stopped error
                IFS='|' read -r status started stopped error <<< "$result"

                log "[$suite] Query $query_id completed: $status"
                add_result "$results_file" "$query" "$query_id" "$threads" \
                           "$status" "$started" "$stopped" "$error"
            done

        done < "$QUERIES_FILE"

        log "[$suite] Killing worker"
        kill_worker

        log "[$suite] Completed benchmark for $threads threads"
    done

    log "========================================="
    log "Suite $suite complete! Results: $results_file"
    log "========================================="

    log "Summary:"
    jq -r '.[] | "  Query \(.query_id) | Threads: \(.threads_number) | Status: \(.status)"' "$results_file"
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
        -q|--queries)
            QUERIES_FILE="$2"
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
            # Validate suite name
            if [[ -z "${SUITE_WORKER_IMAGE[$1]+x}" ]]; then
                die "Unknown suite: $1. Valid suites: ${ALL_SUITES[*]}"
            fi
            SUITES_TO_RUN+=("$1")
            shift
            ;;
    esac
done

# Default: run all suites
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
log "Queries file:   $QUERIES_FILE"
log "Output dir:     $OUTPUT_DIR"

for suite in "${SUITES_TO_RUN[@]}"; do
    run_suite "$suite"
done

log "All benchmarks complete!"
