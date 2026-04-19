#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Default configuration
#THREADS_NUMBERS=(2 4 8 16 32 64)
THREADS_NUMBERS=(4 8 16 32 64)
BUFFER_SIZES=(1048576 2097152 4194304 8388608)
FORMATS=(csv json)
QUERIES_FILE="$SCRIPT_DIR/queries.txt"
TIMESTAMP=$(date +%s)
RESULTS_FILE="$SCRIPT_DIR/results_${TIMESTAMP}.json"
POLL_INTERVAL=2  # seconds
POLL_TIMEOUT=600 # seconds per query
NUM_ITERATIONS=1

# Parse arguments
while getopts "n:" opt; do
    case $opt in
        n)
            NUM_ITERATIONS=$OPTARG
            ;;
        \?)
            echo "Usage: $0 [-n num_iterations]" >&2
            exit 1
            ;;
    esac
done

# Initialize results file
echo "[]" > "$RESULTS_FILE"

# Function to log messages
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"
}

topology_for_format() {
    echo "$SCRIPT_DIR/topology-$1.yaml"
}

# Function to add result to JSON file
add_result() {
    local query_text="$1"
    local query_id="$2"
    local threads="$3"
    local buffer_size="$4"
    local format="$5"
    local status="$6"
    local started="$7"
    local stopped="$8"
    local error="${9:-}"

    local temp_file
    temp_file=$(mktemp)

    jq --arg query "$query_text" \
       --arg qid "$query_id" \
       --arg threads "$threads" \
       --arg buffer_size "$buffer_size" \
       --arg format "$format" \
       --arg status "$status" \
       --arg started "$started" \
       --arg stopped "$stopped" \
       --arg error "$error" \
       '. += [{
           query: $query,
           query_id: $qid,
           threads_number: ($threads | tonumber),
           buffer_size: ($buffer_size | tonumber),
           format: $format,
           status: $status,
           started: $started,
           stopped: $stopped,
           error: $error
       }]' "$RESULTS_FILE" > "$temp_file"

    mv "$temp_file" "$RESULTS_FILE"
}

# Function to poll query status
poll_query_status() {
    local query_id="$1"
    local topology="$2"
    local elapsed=0

    log "Polling status for query $query_id (timeout: ${POLL_TIMEOUT}s)..." >&2

    while [ "$elapsed" -lt "$POLL_TIMEOUT" ]; do
        local status_output
        if ! status_output=$("$SCRIPT_DIR/query_status.sh" "$topology" 2>/dev/null); then
            log "query_status.sh failed, retrying..." >&2
            sleep "$POLL_INTERVAL"
            elapsed=$((elapsed + POLL_INTERVAL))
            continue
        fi

        local query_info
        query_info=$(echo "$status_output" | jq ".[] | select(.local_query_id == $query_id)" 2>/dev/null)

        if [ -z "$query_info" ]; then
            log "Query $query_id not found in status, waiting..." >&2
            sleep "$POLL_INTERVAL"
            elapsed=$((elapsed + POLL_INTERVAL))
            continue
        fi

        local stopped
        stopped=$(echo "$query_info" | jq -r '.stopped')

        if [ "$stopped" != "null" ] && [ -n "$stopped" ]; then
            log "Query $query_id has stopped" >&2

            local status started stopped_time error
            status=$(echo "$query_info" | jq -r '.query_status')
            started=$(echo "$query_info" | jq -r '.started.formatted')
            stopped_time=$(echo "$query_info" | jq -r '.stopped.formatted')
            error=$(echo "$query_info" | jq -r '.error // ""')

            echo "$status|$started|$stopped_time|$error"
            return 0
        fi

        log "Query $query_id still running, waiting... (${elapsed}s)" >&2
        sleep "$POLL_INTERVAL"
        elapsed=$((elapsed + POLL_INTERVAL))
    done

    log "Query $query_id timed out after ${POLL_TIMEOUT}s" >&2
    echo "TIMEOUT|||Timed out after ${POLL_TIMEOUT}s"
    return 0
}

# Main benchmark loop
log "Starting benchmark with timestamp: $TIMESTAMP"
log "Number of iterations per query: $NUM_ITERATIONS"
log "Formats: ${FORMATS[*]}"

# Kill any existing worker before starting
log "Killing any existing worker..."
"$SCRIPT_DIR/kill_worker.sh" || true

log "Queries file: $QUERIES_FILE"

for format in "${FORMATS[@]}"; do
    topology=$(topology_for_format "$format")

    if [ ! -f "$topology" ]; then
        log "Topology file not found for format $format: $topology — skipping"
        continue
    fi

    log "#########################################"
    log "Format: $format (topology: $topology)"
    log "#########################################"

    for threads in "${THREADS_NUMBERS[@]}"; do
        for buffer_size in "${BUFFER_SIZES[@]}"; do
            log "========================================="
            log "[$format] $threads threads, buffer $buffer_size"
            log "========================================="

            while IFS= read -r query || [ -n "$query" ]; do
                [ -z "$query" ] && continue

                for iteration in $(seq 1 "$NUM_ITERATIONS"); do
                    worker_container_id=$("$SCRIPT_DIR/start_worker.sh" "$threads" "$buffer_size") || worker_container_id=""
                    log "Worker started with container ID: $worker_container_id"

                    log "[$format] Submitting query: $query (iteration $iteration/$NUM_ITERATIONS)"

                    local_status=""
                    local_started=""
                    local_stopped=""
                    local_error=""
                    query_id=""

                    if submit_output=$("$SCRIPT_DIR/submit_query.sh" "$query" "$topology" 2>&1); then
                        query_id=$(echo "$submit_output" | tail -n 1)
                    else
                        submit_output="${submit_output:-submit_query.sh failed}"
                        query_id=""
                    fi

                    if [[ "$query_id" =~ ^[0-9]+$ ]]; then
                        log "Query submitted with ID: $query_id"
                        result=$(poll_query_status "$query_id" "$topology")
                        IFS='|' read -r local_status local_started local_stopped local_error <<< "$result"
                        log "Query $query_id completed with status: $local_status"
                    else
                        log "Query submission failed, marking as Failed"
                        local_status="Failed"
                        local_error=$(echo "$submit_output" | tr '\n' ' ' | head -c 1000)
                    fi

                    add_result "$query" "$query_id" "$threads" "$buffer_size" "$format" \
                               "$local_status" "$local_started" "$local_stopped" "$local_error"

                    log "Killing worker..."
                    "$SCRIPT_DIR/kill_worker.sh" || true
                done

            done < "$QUERIES_FILE"

            log "[$format] Completed $threads threads, buffer $buffer_size"
        done
    done

    log "[$format] Completed all iterations"
done

log "========================================="
log "Benchmark complete!"
log "Results saved to: $RESULTS_FILE"
log "========================================="

log "Summary:"
jq -r '.[] | "Query ID: \(.query_id) | Format: \(.format) | Threads: \(.threads_number) | Buffer: \(.buffer_size) | Status: \(.status)"' "$RESULTS_FILE"