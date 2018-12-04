#!/usr/bin/env bash
#mkdir -p $PWD/data
#docker run --name=hbase-docker -d -P -v $PWD/data:/data $1
#docker run --name=hbase-docker -p 8765:8765/tcp -d $1
if [[ ! -d /var/hbase/data ]]; then
   echo "Please create /var/hbase/data folder and set up permission!"
   exit 1
fi
docker run --name=hbase-docker -d -p 8765:8765/tcp -v /var/hbase/data:/data $1
