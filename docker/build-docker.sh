#!/usr/bin/env bash

export LC_ALL=C

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/.. || exit

DOCKER_IMAGE=${DOCKER_IMAGE:-skytere/skytered-develop}
DOCKER_TAG=${DOCKER_TAG:-latest}

BUILD_DIR=${BUILD_DIR:-.}

rm docker/bin/*
mkdir docker/bin
cp $BUILD_DIR/src/skytered docker/bin/
cp $BUILD_DIR/src/skytere-cli docker/bin/
cp $BUILD_DIR/src/skytere-tx docker/bin/
strip docker/bin/skytered
strip docker/bin/skytere-cli
strip docker/bin/skytere-tx

docker build --pull -t $DOCKER_IMAGE:$DOCKER_TAG -f docker/Dockerfile docker
