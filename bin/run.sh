#!/bin/bash

weave launch
docker run -d  --name web01 -v /vagrant/docker/nginx/sites-enabled:/etc/nginx/sites-enabled -v /vagrant/docker/nginx/html:/var/www/html homework/nginx
docker run -d -p 80:80 -p 9000:9000 --name lb01 -v /vagrant/docker/haproxy/config:/haproxy-override -ti homework/haproxy
