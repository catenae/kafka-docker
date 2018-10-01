#!/bin/bash
KAFKA_VERSION=$(cat KAFKA_VERSION)
docker push catenae/kafka
docker push catenae/kafka:$KAFKA_VERSION
