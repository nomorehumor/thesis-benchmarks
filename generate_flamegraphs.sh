#!/bin/bash
# Generate SVG flamegraphs from .perf.report files produced by run_perf.sh.
#
# This script recursively scans a results root for .perf.report files,
# converts them to flamegraph.pl input format, and writes an SVG next
# to each report.
#
# Usage:
#   ./generate_flamegraphs.sh [RESULTS_ROOT]
#
# Defaults:
#   RESULTS_ROOT = script directory
#   FlameGraph   = ./FlameGraph (relative to this script)
#
# Example directory layout:
#   benchmark-a/perf_results/*.perf.report
#   benchmark-b/perf_results/*.perf.report
#   benchmark-c/some/subdir/*.perf.report

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

RESULTS_ROOT="${1:-$SCRIPT_DIR}"
FLAMEGRAPH_DIR="${FLAMEGRAPH_DIR:-$SCRIPT_DIR/FlameGraph}"
FLAMEGRAPH_PL="$FLAMEGRAPH_DIR/flamegraph.pl"

log() { echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*"; }

[[ -d "$RESULTS_ROOT" ]] || { echo "ERROR: results root not found: $RESULTS_ROOT" >&2; exit 1; }
[[ -x "$FLAMEGRAPH_PL" ]] || { echo "ERROR: flamegraph.pl not found/executable at $FLAMEGRAPH_PL" >&2; exit 1; }
command -v tqdm >/dev/null 2>&1 || { echo "ERROR: tqdm not found in PATH" >&2; exit 1; }

log "Results root: $RESULTS_ROOT"
log "flamegraph.pl: $FLAMEGRAPH_PL"

ok=0
fail=0

tmp_reports="$(mktemp)"
trap 'rm -f "$tmp_reports"' EXIT

find "$RESULTS_ROOT" \
    -path "$FLAMEGRAPH_DIR" -prune -o \
    -type f -name '*.perf.report' -print0 | sort -z > "$tmp_reports"

total=$(tr -cd '\0' < "$tmp_reports" | wc -c | awk '{print $1}')

# Find all .perf.report files under all benchmark directories.
while IFS= read -r -d '' report; do
    svg="${report%.perf.report}.svg"
    tag="${report#"$RESULTS_ROOT"/}"

    if [[ -s "$svg" ]]; then
        log "REGEN (overwriting): $tag"
    else
        log "NEW: $tag"
    fi

    folded=$(awk '
        /^[0-9]+(\.[0-9]+)?%[[:space:]]/ {
            pct = $1
            sub(/%$/, "", pct)
            stack = $0
            sub(/^[0-9.]+%[[:space:]]+/, "", stack)

            n = split(stack, frames, ";")
            reversed = frames[n]
            for (i = n - 1; i >= 1; i--) reversed = reversed ";" frames[i]

            count = int(pct * 1000 + 0.5)
            if (count < 1) count = 1
            printf "%s %d\n", reversed, count
        }
    ' "$report")

    if [[ -z "$folded" ]]; then
        folded=$(awk '
            /^[[:space:]]+[0-9]+(\.[0-9]+)?%[[:space:]]+[^[:space:]]+[[:space:]]+[^[:space:]]+[[:space:]]+\[[.k]\][[:space:]]/ {
                pct = $1
                sub(/%$/, "", pct)
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
done < <(
    cat "$tmp_reports" | tqdm --total "$total" --unit files --desc "Flamegraphs"
)

log "========================================="
log "Done. ok=$ok  fail=$fail"
log "========================================="