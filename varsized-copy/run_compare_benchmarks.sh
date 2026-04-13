#!/bin/bash

cd baseline
/bin/bash ./run_benchmark.sh -n 10

cd ..
cd optimized
/bin/bash ./run_benchmark.sh -n 10
cd ..
