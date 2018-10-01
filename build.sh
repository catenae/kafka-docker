#!/bin/bash
KAFKA_VERSION=$(cat KAFKA_VERSION)
KAFKA_SUBVERSION=$(cat KAFKA_SUBVERSION)
docker build \
--build-arg KAFKA_VERSION=$KAFKA_VERSION \
--build-arg KAFKA_SUBVERSION=$KAFKA_SUBVERSION -t catenae/kafka .
docker tag catenae/kafka catenae/kafka:$KAFKA_VERSION
