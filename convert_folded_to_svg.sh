#!/usr/bin/env bash
set -euo pipefail

FLAMEGRAPH="/Users/maxim.popov/CLionProjects/thesis-benchmarks/FlameGraph/flamegraph.pl"

if [[ ! -x "$FLAMEGRAPH" ]]; then
  echo "Error: '$FLAMEGRAPH' not found or not executable."
  exit 1
fi

found=0

while IFS= read -r -d '' folded_file; do
  found=1
  svg_file="${folded_file%.folded}.svg"

  echo "Converting '${folded_file}' -> '${svg_file}'"
  "$FLAMEGRAPH" "$folded_file" > "$svg_file"
done < <(find . -type f -name '*.folded' -print0)

if [[ $found -eq 0 ]]; then
  echo "No .folded files found in the current directory or its subdirectories."
fi

