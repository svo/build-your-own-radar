#!/bin/bash

docker run -d -v input.csv:/opt/build-your-own-radar -p 80:80 svanosselaer/build-your-own-radar
