#!/bin/bash

rm -rf resources dist &&

npm install &&

npm run build &&

cp -r dist resources &&

docker build -t svanosselaer/build-your-own-radar:latest .
