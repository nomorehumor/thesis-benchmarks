#!/bin/bash

sudo docker run --network mynet   -v "$PWD/topology.yaml:/work/topology.yaml:ro"   nebulastream/nes-cli:maxim-popov-concat-varsized-materialization -t /work/topology.yaml   -s worker-max:8080 -d start "$1"
