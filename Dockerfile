# Kafka (Vanilla) on CentOS 7.
# Copyright (C) 2017-2018 Rodrigo Martínez <dev@brunneis.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

FROM brunneis/jdk-centos:1.8
MAINTAINER "Rodrigo Martínez" <dev@brunneis.com>

################################################
# KAFKA
################################################

ARG KAFKA_VERSION
ARG KAFKA_SUBVERSION
ENV KAFKA_ARCHIVE kafka_$KAFKA_SUBVERSION-$KAFKA_VERSION.tgz
ENV KAFKA_ARCHIVE_URL https://archive.apache.org/dist/kafka/$KAFKA_VERSION/$KAFKA_ARCHIVE
ENV KAFKA_SHA1_URL $KAFKA_ARCHIVE_URL.sha1
ENV KAFKA_INSTALL_DIR /opt/kafka

# Install Kafka
RUN \
    yum -y update && yum clean all \
    && yum -y install \
        wget \
    && wget $KAFKA_ARCHIVE_URL \
    && wget $KAFKA_SHA1_URL \
    && mkdir $KAFKA_INSTALL_DIR \
    && sha1sum $KAFKA_ARCHIVE.sha1 \
    && tar xvf $KAFKA_ARCHIVE -C $KAFKA_INSTALL_DIR \
    && rm -f $KAFKA_ARCHIVE \
    && rm -f $KAFKA_ARCHIVE.sha1 \
    && ln -s $KAFKA_INSTALL_DIR/*kafka* $KAFKA_INSTALL_DIR/default

# Add Kafka binaries to PATH
ENV PATH=$KAFKA_INSTALL_DIR/default/bin:$PATH

# Overwrite default configuration files
COPY config $KAFKA_INSTALL_DIR/default/config
COPY bin $KAFKA_INSTALL_DIR/default/bin

# Start Kafka (standalone mode)
COPY entrypoint.sh /
ENTRYPOINT ["bash", "entrypoint.sh"]
