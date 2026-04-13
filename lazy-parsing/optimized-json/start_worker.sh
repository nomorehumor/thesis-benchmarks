#!/bin/bash

sudo docker run --rm  --network mynet --cpus 64 --name worker-max -v "/data/users/maxim/large:/work/large:ro"  -d nebulastream/worker:maxim-popov-lazy-parsing --worker.query_engine.number_of_worker_threads=$1 --worker.default_query_execution.operator_buffer_size=$2
