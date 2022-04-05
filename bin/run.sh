#!bin/bash

docker run --rm -it -p 8888:80 -e TUNNEL_PATH=/gateway -e TUNNEL_URL=host.docker.internal/ --name nginx giocavallari/nginx_proxy
