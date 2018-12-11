#!/usr/bin/env bash
#mkdir -p $PWD/data
#docker run --name=hbase-docker -d -P -v $PWD/data:/data $1
#docker run --name=hbase-docker -p 8765:8765/tcp -d $1
if [[ "$#" -lt 2 ]];then
  echo "Usage: ./run.sh <image> <docker-container-name>"
  exit 1
fi

if [[ ! -d /var/hbase/data ]]; then
   echo "Please create /var/hbase/data folder and set up permission!"
   exit 1
fi

#docker run --name=hbase-phoenix --sysctl net.ipv6.conf.all.disable_ipv6=1 -d -p 8765:8765/tcp -v /var/hbase/data:/data $1
docker run --hostname $2 --name=$2 -d -p 8765:8765/tcp -p 2181:2181/tcp -p 16000:16000/tcp -p 16010:16010/tcp -p 16020:16020/tcp -p 16030:16030/tcp -p 16201:16201/tcp -p 16301:16301/tcp -v /var/hbase/data:/data:Z $1
