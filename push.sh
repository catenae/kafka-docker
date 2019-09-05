#!/bin/bash
source env.sh
docker push catenae/kafka-base
docker push catenae/kafka-base:$KAFKA_VERSION
docker push catenae/kafka
