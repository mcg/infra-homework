#!/bin/bash

docker rm $(docker ps -a -q)
docker stop web01 web02 lb01
docker rm web01 web01 lb01
docker rmi homework/nginx homework/haproxy homework/base
docker rmi $(docker images | grep "^<none>" | awk "{print $3}")
