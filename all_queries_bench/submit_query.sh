#!/bin/bash

QUERY="$1"
TOPOLOGY="${2:-$PWD/topology.yaml}"

sudo docker run --network mynet   -v "$TOPOLOGY:/work/topology.yaml:ro"   nebulastream/nes-cli:maxim-popov-master-baseline -t /work/topology.yaml   -s worker-max:8080 -d start "$QUERY"