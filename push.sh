#!/bin/bash
source env.sh
docker push catenae/kafka
docker push catenae/kafka:$KAFKA_VERSION
