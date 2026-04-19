#!/bin/bash
# Generate SVG flamegraphs from .perf.report files produced by run_perf.sh.
#
# Those reports contain folded stacks inline (produced by
# `perf report --call-graph folded,...`). This script extracts them,
# converts the "<pct>% stack;stack;..." lines to flamegraph.pl's
# "stack;stack;... <count>" format, and renders an SVG next to each report.
#
# Usage:
#   ./generate_flamegraphs.sh [RESULTS_DIR]
#
# Defaults:
#   RESULTS_DIR = varsized-copy/perf_results (relative to this script)
#   FlameGraph  = ./FlameGraph (relative to this script)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

RESULTS_DIR="${1:-$SCRIPT_DIR/varsized-copy/perf_results}"
FLAMEGRAPH_DIR="${FLAMEGRAPH_DIR:-$SCRIPT_DIR/FlameGraph}"
FLAMEGRAPH_PL="$FLAMEGRAPH_DIR/flamegraph.pl"

log() { echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"; }

[[ -d "$RESULTS_DIR"  ]] || { echo "ERROR: results dir not found: $RESULTS_DIR" >&2; exit 1; }
[[ -x "$FLAMEGRAPH_PL" ]] || { echo "ERROR: flamegraph.pl not found/executable at $FLAMEGRAPH_PL" >&2; exit 1; }

log "Results dir: $RESULTS_DIR"
log "flamegraph.pl: $FLAMEGRAPH_PL"

ok=0
fail=0

# Find all .perf.report files
while IFS= read -r -d '' report; do
    svg="${report%.perf.report}.svg"
    tag="${report#"$RESULTS_DIR/"}"

    if [[ -s "$svg" ]]; then
        log "REGEN (overwriting): $tag"
    else
        log "NEW: $tag"
    fi

    # Extract stack data from the report.
    #
    # Two formats exist:
    #   1. Folded lines (from `perf report --call-graph folded,...`):
    #        "<pct>% frame1;frame2;...;frameN"  (callee-first)
    #      These give us full call-stack hierarchy. We reverse the ';'-joined
    #      frames because flamegraph.pl expects root-first.
    #
    #   2. Traditional flat rows (from plain `perf report --stdio`):
    #        "     <pct>%  <command>  <dso>  [.|k] <symbol>"
    #      No hierarchy. We emit each as a 1-deep stack "<symbol> <count>".
    #
    # Folded is preferred when present; otherwise we fall back to flat rows.
    # flamegraph.pl expects an integer "count"; multiplying percentages by
    # 1000 keeps two decimals of precision ("permille").
    folded=$(awk '
        # Folded line: starts with a digit, no leading whitespace, contains
        # ";"-joined stack.
        /^[0-9]+(\.[0-9]+)?%[[:space:]]/ {
            pct = $1
            sub(/%$/, "", pct)
            stack = $0
            sub(/^[0-9.]+%[[:space:]]+/, "", stack)

            # Reverse callee-first -> root-first.
            n = split(stack, frames, ";")
            reversed = frames[n]
            for (i = n - 1; i >= 1; i--) reversed = reversed ";" frames[i]

            count = int(pct * 1000 + 0.5)
            if (count < 1) count = 1
            printf "%s %d\n", reversed, count
        }
    ' "$report")

    if [[ -z "$folded" ]]; then
        # Fallback: flat rows. Example:
        #   "     3.43%  WorkerThread-12  nes-single-node-worker  [.] std::char_traits::find"
        folded=$(awk '
            /^[[:space:]]+[0-9]+(\.[0-9]+)?%[[:space:]]+[^[:space:]]+[[:space:]]+[^[:space:]]+[[:space:]]+\[[.k]\][[:space:]]/ {
                pct = $1
                sub(/%$/, "", pct)
                # Everything after "[.] " or "[k] " is the symbol (may contain spaces).
                line = $0
                sub(/^.*[[:space:]]\[[.k]\][[:space:]]+/, "", line)
                if (line == "") next
                count = int(pct * 1000 + 0.5)
                if (count < 1) count = 1
                printf "%s %d\n", line, count
            }
        ' "$report")
    fi

    if [[ -z "$folded" ]]; then
        log "FAIL (no usable stack data): $tag"
        fail=$((fail + 1))
        continue
    fi

    title="${tag%.perf.report}"
    if printf '%s\n' "$folded" | "$FLAMEGRAPH_PL" \
            --title "$title" \
            --countname "permille" \
            --width 1600 \
            > "$svg"; then
        log "OK: $svg"
        ok=$((ok + 1))
    else
        log "FAIL (flamegraph.pl): $tag"
        rm -f "$svg"
        fail=$((fail + 1))
    fi
done < <(find "$RESULTS_DIR" -type f -name '*.perf.report' -print0 | sort -z)

log "========================================="
log "Done. ok=$ok  fail=$fail"
log "========================================="