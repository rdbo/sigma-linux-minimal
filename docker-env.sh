#!/bin/sh

docker build -t sigma-linux-minimal .
docker run -v "$(pwd):/app" -it sigma-linux-minimal
