#!/bin/bash

docker pull svanosselaer/build-your-own-radar-buildnode &&

docker run --rm -ti -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd):/build-your-own-radar-buildnode -w=/build-your-own-radar-buildnode svanosselaer/build-your-own-radar-buildnode /bin/bash -c "npm test"
