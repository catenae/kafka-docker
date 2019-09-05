# Kafka (Vanilla) on CentOS 7.
# Copyright (C) 2017-2019 Rodrigo Martínez <dev@brunneis.com>
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

FROM ibmjava:8-jre

################################################
# KAFKA
################################################

ARG KAFKA_VERSION
ARG KAFKA_SUBVERSION
ENV KAFKA_INSTALL_DIR=/opt/kafka

RUN \
    ARCHIVE=kafka_$KAFKA_SUBVERSION-$KAFKA_VERSION.tgz && \
    ARCHIVE_URL=https://archive.apache.org/dist/kafka/$KAFKA_VERSION/$ARCHIVE && \
    CHECKSUM_URL=$ARCHIVE_URL.sha1 && \
    wget $ARCHIVE_URL && \
    wget $CHECKSUM_URL && \
    mkdir $KAFKA_INSTALL_DIR && \
    sha1sum $ARCHIVE.sha1 && \
    tar xvf $ARCHIVE -C $KAFKA_INSTALL_DIR && \
    rm -f $ARCHIVE && \
    rm -f $ARCHIVE.sha1 && \
    ln -s $KAFKA_INSTALL_DIR/*kafka* $KAFKA_INSTALL_DIR/default

ENV PATH=$KAFKA_INSTALL_DIR/default/bin:$PATH
ENTRYPOINT bash --login -i
