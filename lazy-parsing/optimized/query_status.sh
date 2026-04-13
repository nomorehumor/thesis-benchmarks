#!/bin/bash

sudo docker run --network mynet   -v "$PWD/topology.yaml:/work/topology.yaml:ro"   nebulastream/nes-cli:maxim-popov-lazy-parsing   -t /work/topology.yaml   -s worker-max:8080 $1 status
