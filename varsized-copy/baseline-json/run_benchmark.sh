#!/bin/bash

set -e

# Default configuration
THREADS_NUMBERS=(2 4 8 16 32 48 64)
QUERIES_DIR="queries"
TIMESTAMP=$(date +%s)
RESULTS_FILE="results_${TIMESTAMP}.json"
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
    local query_file="$1"
    local query_id="$2"
    local threads="$3"
    local state="$4"
    local start_time_ms="$5"
    local stop_time_ms="$6"

    # Create temporary file with new entry
    local temp_file=$(mktemp)

    # Read current results, add new entry, write back
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
       }]' "$RESULTS_FILE" > "$temp_file"

    mv "$temp_file" "$RESULTS_FILE"
}

# Main benchmark loop
log "Starting benchmark with timestamp: $TIMESTAMP"
log "Number of iterations per query: $NUM_ITERATIONS"

# Kill any existing worker before starting
log "Killing any existing worker..."
./kill_worker.sh || true

# Find and log all query files
query_files=("$QUERIES_DIR"/*.yaml)
if [ ! -e "${query_files[0]}" ]; then
    log "ERROR: No query files found in $QUERIES_DIR/"
    exit 1
fi
log "Found ${#query_files[@]} query file(s) in $QUERIES_DIR/:"
for f in "${query_files[@]}"; do
    log "  - $f"
done

for threads in "${THREADS_NUMBERS[@]}"; do
    log "========================================="
    log "Starting worker with $threads threads"
    log "========================================="

    # Start worker
    worker_container_id=$(./start_worker.sh "$threads")
    log "Worker started with container ID: $worker_container_id"

    # Process each query yaml file in queries directory
    for query_file in "$QUERIES_DIR"/*.yaml; do
        # Skip if no yaml files found
        [ -e "$query_file" ] || continue

        # Run each query N times
        for iteration in $(seq 1 $NUM_ITERATIONS); do
            log "Submitting query from: $query_file (iteration $iteration/$NUM_ITERATIONS)"

            # Submit query (blocks until query finishes) and get query_id
            query_id=$(./submit_query.sh "$query_file")

            log "Query $query_id finished, fetching status..."

            # Get query status (returns JSON with metrics)
            status_output=$(./query_status.sh "$query_id")

            # Parse the status output (JSON format)
            state=$(echo "$status_output" | jq -r '.state')
            start_time_ms=$(echo "$status_output" | jq -r '.metrics.start_time_ms')
            stop_time_ms=$(echo "$status_output" | jq -r '.metrics.stop_time_ms')

            log "Query $query_id completed with state: $state"

            # Store result
            add_result "$query_file" "$query_id" "$threads" "$state" "$start_time_ms" "$stop_time_ms"
        done

    done

    # Kill worker
    log "Killing worker..."
    ./kill_worker.sh

    log "Completed benchmark for $threads threads"
done

log "========================================="
log "Benchmark complete!"
log "Results saved to: $RESULTS_FILE"
log "========================================="

# Pretty print final results summary
log "Summary:"
jq -r '.[] | "Query: \(.query_file) | ID: \(.query_id) | Threads: \(.threads_number) | State: \(.state)"' "$RESULTS_FILE"
