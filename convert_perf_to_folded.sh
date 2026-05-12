#!/usr/bin/env bash
set -euo pipefail

STACKCOLLAPSE="/Users/maxim.popov/CLionProjects/thesis-benchmarks/FlameGraph/stackcollapse-perf.pl"

if [[ ! -x "$STACKCOLLAPSE" ]]; then
  echo "Error: '$STACKCOLLAPSE' not found or not executable."
  exit 1
fi

found=0

while IFS= read -r -d '' perf_file; do
  found=1
  folded_file="${perf_file%.perf}.folded"

  echo "Converting '${perf_file}' -> '${folded_file}'"
  "$STACKCOLLAPSE" --all "$perf_file" > "$folded_file"
done < <(find . -type f -name '*.perf' -print0)

if [[ $found -eq 0 ]]; then
  echo "No .perf files found in the current directory or its subdirectories."
fi