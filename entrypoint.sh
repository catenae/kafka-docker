#!/bin/bash
zookeeper-server-start.sh $KAFKA_INSTALL_DIR/default/config/zookeeper.properties &
exec kafka-server-start.sh $KAFKA_INSTALL_DIR/default/config/server.properties
