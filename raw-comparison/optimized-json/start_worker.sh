#!/bin/bash

sudo docker run --rm  --network mynet --name worker-max -v "/data/users/maxim/large:/work/large:ro" -v "$PWD/tmp:/tmp" -d nebulastream/worker:maxim-popov-raw-data-comparison --worker.query_engine.number_of_worker_threads=$1
