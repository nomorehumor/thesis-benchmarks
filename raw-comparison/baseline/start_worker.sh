#!/bin/bash

sudo docker run --rm  --network mynet --name worker-max -v "/data/users/maxim/large:/work/large:ro" -d  nebulastream/worker:maxim-popov-master-baseline --worker.query_engine.number_of_worker_threads=$1
