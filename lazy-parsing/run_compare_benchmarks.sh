#!/bin/bash

cd baseline
/bin/bash ./run_benchmark.sh

cd ..
cd optimized
/bin/bash ./run_benchmark.sh
cd ..
