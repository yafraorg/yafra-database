#-------------------------------------------------------------------------------
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#
# (c) yafra.org, 2002, Switzerland
#
#-------------------------------------------------------------------------------
#
# MongoDB docker file (based on ubuntu - currently 2.4.x)

FROM mongo:latest
MAINTAINER Yafra <yafraorg@gmail.com>

# Install neede software
RUN   apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y vim git procps && \
  apt-get autoremove -yq && \
  apt-get clean all && \
  rm -rf /var/lib/apt/lists/*

# Setup mongo daemon
RUN echo "auth = true" >> /etc/mongod.conf  && \
  echo "net:" >> /etc/mongod.conf  && \
  echo "  port: 27017" >> /etc/mongod.conf  && \
  echo "  bindIp: 0.0.0.0" >> /etc/mongod.conf
EXPOSE 27017

# Install yafra db scripts via git
RUN mkdir -p /work/repos && mkdir -p /work/yafra-runtime
RUN cd /work/repos && git clone https://github.com/yafraorg/yafra-database.git

# Define mountable directories.
VOLUME ["/data"]
