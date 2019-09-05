#!/bin/bash
source env.sh
docker build \
--build-arg KAFKA_VERSION=$KAFKA_VERSION \
--build-arg KAFKA_SUBVERSION=$KAFKA_SUBVERSION -t catenae/kafka-base .
docker tag catenae/kafka-base catenae/kafka-base:$KAFKA_VERSION
docker build -t catenae/kafka -f Dockerfile.standalone .
