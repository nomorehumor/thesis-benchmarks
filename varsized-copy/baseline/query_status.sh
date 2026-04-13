#!/bin/bash

sudo docker run --network mynet   -v "$PWD/topology.yaml:/work/topology.yaml:ro" -v "$PWD/query.yaml:/work/query.yaml:ro"  nebulastream/nebuli:maxim-popov-nebuli-update-x64 -s worker-max:8080 status $1
