#!/bin/bash

TOPOLOGY="${1:-$PWD/topology.yaml}"

sudo docker run --network mynet   -v "$TOPOLOGY:/work/topology.yaml:ro"   nebulastream/nes-cli:maxim-popov-lazy-parsing   -t /work/topology.yaml   -s worker-max:8080 status