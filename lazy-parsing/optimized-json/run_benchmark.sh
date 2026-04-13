#!/bin/bash

set -e

# Default configuration
THREADS_NUMBERS=(2 4 8 16 32 64)
BUFFER_SIZES=(4096 8192 16384 32768 65536 80000 100000)
QUERIES_FILE="queries.txt"
TIMESTAMP=$(date +%s)
RESULTS_FILE="results_${TIMESTAMP}.json"
POLL_INTERVAL=2  # seconds
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

# Function to add result to JSON file
add_result() {
    local query_text="$1"
    local query_id="$2"
    local threads="$3"
    local buffer_size="$4"
    local status="$5"
    local started="$6"
    local stopped="$7"
    local error="${8:-}"

    # Create temporary file with new entry
    local temp_file=$(mktemp)

    # Read current results, add new entry, write back
    jq --arg query "$query_text" \
       --arg qid "$query_id" \
       --arg threads "$threads" \
       --arg buffer_size "$buffer_size" \
       --arg status "$status" \
       --arg started "$started" \
       --arg stopped "$stopped" \
       --arg error "$error" \
       '. += [{
           query: $query,
           query_id: $qid,
           threads_number: ($threads | tonumber),
           buffer_size: ($buffer_size | tonumber),
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

    log "Polling status for query $query_id..." >&2

    while true; do
        # Get query status
        local status_output=$(./query_status.sh)

        # Check if our query_id exists and has stopped
        local query_info=$(echo "$status_output" | jq ".[] | select(.local_query_id == $query_id)")

        if [ -z "$query_info" ]; then
            log "Query $query_id not found in status, waiting..." >&2
            sleep "$POLL_INTERVAL"
            continue
        fi

        # Check if stopped field exists (not null and not empty)
        local stopped=$(echo "$query_info" | jq -r '.stopped')

        if [ "$stopped" != "null" ] && [ -n "$stopped" ]; then
            log "Query $query_id has stopped" >&2

            # Extract all necessary fields
            local status=$(echo "$query_info" | jq -r '.query_status')
            local started=$(echo "$query_info" | jq -r '.started.formatted')
            local stopped_time=$(echo "$query_info" | jq -r '.stopped.formatted')
            local error=$(echo "$query_info" | jq -r '.error // ""')

            echo "$status|$started|$stopped_time|$error"
            return 0
        fi

        log "Query $query_id still running, waiting..." >&2
        sleep "$POLL_INTERVAL"
    done
}

# Main benchmark loop
log "Starting benchmark with timestamp: $TIMESTAMP"
log "Number of iterations per query: $NUM_ITERATIONS"

# Kill any existing worker before starting
log "Killing any existing worker..."
./kill_worker.sh || true

# Log queries file
log "Queries file: $QUERIES_FILE"

for threads in "${THREADS_NUMBERS[@]}"; do
    for buffer_size in "${BUFFER_SIZES[@]}"; do
        log "========================================="
        log "Starting benchmark with $threads threads, buffer size $buffer_size"
        log "========================================="

        # Process each query
        while IFS= read -r query || [ -n "$query" ]; do
            # Skip blank lines
            [ -z "$query" ] && continue

            # Run each query N times
            for iteration in $(seq 1 $NUM_ITERATIONS); do
                # Start worker
                worker_container_id=$(./start_worker.sh "$threads" "$buffer_size")
                log "Worker started with container ID: $worker_container_id"

                log "Submitting query: $query (iteration $iteration/$NUM_ITERATIONS)"

                # Submit query and capture output
                submit_output=$(./submit_query.sh "$query")
                query_id=$(echo "$submit_output" | tail -n 1)

                log "Query submitted with ID: $query_id"

                # Poll for query completion
                result=$(poll_query_status "$query_id")

                # Parse result
                IFS='|' read -r status started stopped error <<< "$result"

                log "Query $query_id completed with status: $status"

                # Store result
                add_result "$query" "$query_id" "$threads" "$buffer_size" "$status" "$started" "$stopped" "$error"

                # Kill worker
                log "Killing worker..."
                ./kill_worker.sh || true
            done

        done < "$QUERIES_FILE"

        log "Completed benchmark for $threads threads, buffer size $buffer_size"
    done
done

log "========================================="
log "Benchmark complete!"
log "Results saved to: $RESULTS_FILE"
log "========================================="

# Pretty print final results summary
log "Summary:"
jq -r '.[] | "Query ID: \(.query_id) | Threads: \(.threads_number) | Buffer: \(.buffer_size) | Status: \(.status)"' "$RESULTS_FILE"

