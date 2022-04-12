#!bin/bash

# $1 - TUNNEL_URL
# $2 - TUNNEL_PATH
# $3 - HOST_PORT
# $4 - TUNNEL_PORT
# $5 - CONTAINER_NAME

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ] || [ -z "$4" ]
then
    echo "USAGE: docker run --rm -it -p [TUNNEL_PORT]:80 -e TUNNEL_PATH=[TUNNEL_PATH] -e TUNNEL_URL=[TUNNEL_URL]:[TUNNEL_PORT] --name [CONTAINER_NAME] giocavallari/nginx-proxy";
    echo "ERROR: Missing params";
    exit;
fi

if [ -z "$5" ]
then
    docker run --rm -it -p $3:80 -e TUNNEL_PATH=$2 -e TUNNEL_URL=$1:$4/ giocavallari/nginx-proxy
else
    docker run --rm -it -p $3:80 -e TUNNEL_PATH=$2 -e TUNNEL_URL=$1:$4/ --name $5 giocavallari/nginx-proxy
fi