#!/bin/bash

sudo docker run --rm  --network mynet --name worker-max -v "/data/users/maxim/large:/work/large:ro" -p 8080:8080 -d  nebulastream/worker:maxim-popov-baseline-varsized-memcpy --grpc="worker-max:8080" --worker.query_engine.number_of_worker_threads=$1
