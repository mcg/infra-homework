#!/bin/bash

cd /vagrant
docker pull ubuntu:trusty
docker build -t="homework/base" ./docker/base
docker build -t="homework/haproxy" ./docker/haproxy
docker build -t="homework/nginx" ./docker/nginx
