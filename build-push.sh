#!/bin/bash

docker build -t catenae/kafka .
docker build -t catenae/kafka:1.0.0 .

docker push catenae/kafka
docker push catenae/kafka:1.0.0
