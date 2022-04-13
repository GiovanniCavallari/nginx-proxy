#!/bin/bash

# $1 - HOST_PORT
# $2 - TUNNEL_PORT
# $3 - TUNNEL_PATH
# $4 - CONTAINER_NAME

INTERNAL_HOST=host.docker.internal

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]
then
    echo "USAGE: docker run --rm -it -p [HOST_PORT]:80 -e TUNNEL_PATH=[TUNNEL_PATH] -e TUNNEL_PORT=[TUNNEL_PORT] --name [CONTAINER_NAME] giocavallari/nginx-proxy";
    echo "ERROR: Missing params";
    exit;
fi

if [ -z "$4" ]
then

    if [[ $OSTYPE == 'darwin'* ]];
    then
        docker run --rm -it -p $1:80 -e TUNNEL_PATH=$3 -e TUNNEL_PORT=$2/ giocavallari/nginx-proxy
    elif [[ $OSTYPE == 'linux'* ]]; 
    then
        docker run --rm -it -p $1:80 -e TUNNEL_PATH=$3 -e TUNNEL_PORT=$2/ --net=host --add-host=$INTERNAL_HOST:127.0.0.1 giocavallari/nginx-proxy
    else
        exit;
    fi

else

    if [[ $OSTYPE == 'darwin'* ]];
    then
        docker run --rm -it -p $1:80 -e TUNNEL_PATH=$3 -e TUNNEL_PORT=$2/ --name $4 giocavallari/nginx-proxy
    elif [[ $OSTYPE == 'linux'* ]]; 
    then
        docker run --rm -it -p $1:80 -e TUNNEL_PATH=$3 -e TUNNEL_PORT=$2/ --net=host --add-host=$INTERNAL_HOST:127.0.0.1 --name $4 giocavallari/nginx-proxy
    else
        exit;
    fi

fi