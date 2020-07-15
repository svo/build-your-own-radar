#!/bin/bash

path=${1:-$(pwd)}

docker rm -f build-your-own-radar
docker run --name build-your-own-radar -d -v $path/input.csv:/opt/build-your-own-radar/input.csv -p 80:80 svanosselaer/build-your-own-radar:latest
