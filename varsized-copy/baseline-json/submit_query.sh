#!/bin/bash

QUERY_ID=$(sudo docker run --network mynet -v "$PWD:/work/:ro"  nebulastream/nebuli:maxim-popov-baseline-varsized-memcpy -s worker-max:8080 -w register -i "/work/$1" -x)
echo $QUERY_ID
