#!/bin/bash
# Run all benchmarks first, then all perf profiling.
# Everything runs strictly sequentially — one (category, suite) at a time.
# A failure in any single run does NOT stop the rest.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Each entry: "relative_script_path:suite:label"
# suite may be empty for scripts that don't take a suite argument.
BENCHMARK_RUNS=(
    "concat/run_benchmarks.sh:baseline:concat/baseline"
    "concat/run_benchmarks.sh:optimized:concat/optimized"
    "concat/run_benchmarks.sh:baseline-json:concat/baseline-json"
    "concat/run_benchmarks.sh:optimized-json:concat/optimized-json"

    "raw-comparison/run_benchmarks.sh:baseline:raw-comparison/baseline"
    "raw-comparison/run_benchmarks.sh:optimized:raw-comparison/optimized"
    "raw-comparison/run_benchmarks.sh:baseline-json:raw-comparison/baseline-json"
    "raw-comparison/run_benchmarks.sh:optimized-json:raw-comparison/optimized-json"

    "varsized-copy/run_benchmarks.sh:baseline:varsized-copy/baseline"
    "varsized-copy/run_benchmarks.sh:optimized:varsized-copy/optimized"
    "varsized-copy/run_benchmarks.sh:baseline-json:varsized-copy/baseline-json"
    "varsized-copy/run_benchmarks.sh:optimized-json:varsized-copy/optimized-json"

    "lazy-parsing/run_benchmarks.sh:baseline:lazy-parsing/baseline"
    "lazy-parsing/run_benchmarks.sh:optimized:lazy-parsing/optimized"
    "lazy-parsing/run_benchmarks.sh:baseline-json:lazy-parsing/baseline-json"
    "lazy-parsing/run_benchmarks.sh:optimized-json:lazy-parsing/optimized-json"

    "all_queries_bench/run_benchmark.sh::all_queries_bench"
)

PERF_RUNS=(
    "concat/run_perf.sh:baseline:concat/baseline"
    "concat/run_perf.sh:optimized:concat/optimized"
    "concat/run_perf.sh:baseline-json:concat/baseline-json"
    "concat/run_perf.sh:optimized-json:concat/optimized-json"

    "raw-comparison/run_perf.sh:baseline:raw-comparison/baseline"
    "raw-comparison/run_perf.sh:optimized:raw-comparison/optimized"
    "raw-comparison/run_perf.sh:baseline-json:raw-comparison/baseline-json"
    "raw-comparison/run_perf.sh:optimized-json:raw-comparison/optimized-json"

    "varsized-copy/run_perf.sh:baseline:varsized-copy/baseline"
    "varsized-copy/run_perf.sh:optimized:varsized-copy/optimized"
    "varsized-copy/run_perf.sh:baseline-json:varsized-copy/baseline-json"
    "varsized-copy/run_perf.sh:optimized-json:varsized-copy/optimized-json"

    "lazy-parsing/run_perf.sh:baseline:lazy-parsing/baseline"
    "lazy-parsing/run_perf.sh:optimized:lazy-parsing/optimized"
    "lazy-parsing/run_perf.sh:baseline-json:lazy-parsing/baseline-json"
    "lazy-parsing/run_perf.sh:optimized-json:lazy-parsing/optimized-json"

    "all_queries_bench/run_perf.sh::all_queries_bench"
)

log() { echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"; }

SUCCESSES=()
FAILURES=()

run_one() {
    local phase="$1" rel_path="$2" suite="$3" label="$4"
    local abs_path="$SCRIPT_DIR/$rel_path"
    local work_dir
    work_dir="$(dirname "$abs_path")"

    log "========================================="
    log "[$phase] Starting: $label"
    log "  script: $rel_path${suite:+  suite: $suite}"
    log "========================================="

    if [[ ! -f "$abs_path" ]]; then
        log "[$phase] SKIP $label: script not found at $abs_path"
        FAILURES+=("$phase:$label (missing)")
        return
    fi

    # Subshell so child's `set -e` / exit can't kill parent.
    # cd into script dir so relative paths inside work.
    local rc=0
    if [[ -n "$suite" ]]; then
        ( cd "$work_dir" && bash "$(basename "$abs_path")" "$suite" ) || rc=$?
    else
        ( cd "$work_dir" && bash "$(basename "$abs_path")" ) || rc=$?
    fi

    if (( rc == 0 )); then
        log "[$phase] OK: $label"
        SUCCESSES+=("$phase:$label")
    else
        log "[$phase] FAIL (exit $rc): $label — continuing"
        FAILURES+=("$phase:$label (exit $rc)")
    fi
}

run_list() {
    local phase="$1"
    shift
    for entry in "$@"; do
        # entry format: "rel_path:suite:label"  (suite may be empty)
        local rel_path="${entry%%:*}"
        local rest="${entry#*:}"
        local suite="${rest%%:*}"
        local label="${rest#*:}"
        run_one "$phase" "$rel_path" "$suite" "$label"
    done
}

log "########################################"
log "# Phase 1: Benchmarks"
log "########################################"
run_list "BENCH" "${BENCHMARK_RUNS[@]}"

log "########################################"
log "# Phase 2: Perf profiling"
log "########################################"
run_list "PERF" "${PERF_RUNS[@]}"

log "########################################"
log "# Summary"
log "########################################"
log "Successes: ${#SUCCESSES[@]}"
for s in "${SUCCESSES[@]}"; do log "  OK   $s"; done
log "Failures:  ${#FAILURES[@]}"
for f in "${FAILURES[@]}"; do log "  FAIL $f"; done

[[ ${#FAILURES[@]} -eq 0 ]]
