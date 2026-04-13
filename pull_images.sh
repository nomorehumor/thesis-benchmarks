#!/bin/bash
set -euo pipefail

# All Docker images used across benchmark suites.

IMAGES=(
    # master
    nebulastream/worker:maxim-popov-master-baseline
    nebulastream/nes-cli:maxim-popov-master-baseline

    # raw-comparison
    nebulastream/worker:maxim-popov-raw-data-comparison
    nebulastream/nes-cli:maxim-popov-raw-data-comparison

    # lazy-parsing
    nebulastream/nes-cli:maxim-popov-lazy-parsing
    nebulastream/worker:maxim-popov-lazy-parsing

    # concat
    nebulastream/worker:maxim-popov-concat-varsized-materialization
    nebulastream/nes-cli:maxim-popov-concat-varsized-materialization

    # varsized-copy (nebuli API)
    nebulastream/worker:maxim-popov-baseline-varsized-memcpy
    nebulastream/nebuli:maxim-popov-baseline-varsized-memcpy
    nebulastream/worker:maxim-popov-remove-memcpy-bench
    nebulastream/nebuli:maxim-popov-remove-memcpy-bench
)

echo "Pulling ${#IMAGES[@]} images..."

for image in "${IMAGES[@]}"; do
    echo "--- Pulling $image ---"
    sudo docker pull "$image"
done

echo "All images pulled."
