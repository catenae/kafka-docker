#!/bin/bash

docker build -t brunneis/kafka .
docker build -t brunneis/kafka:1.0.0 .

docker push brunneis/kafka
docker push brunneis/kafka:1.0.0
