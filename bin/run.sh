#!bin/bash

# $1 - HOST_PORT
# $2 - TUNNEL_PORT
# $3 - TUNNEL_PATH
# $4 - CONTAINER_NAME

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]
then
    echo "USAGE: docker run --rm -it -p [HOST_PORT]:80 -e TUNNEL_PATH=[TUNNEL_PATH] -e TUNNEL_URL=[TUNNEL_URL]:[TUNNEL_PORT] --name [CONTAINER_NAME] giocavallari/nginx-proxy";
    echo "ERROR: Missing params";
    exit;
fi

if [ -z "$4" ]
then
    docker run --rm -it -p $1:80 -e TUNNEL_PATH=$3 -e TUNNEL_URL=host.docker.internal:$2/ giocavallari/nginx-proxy
else

    if [[ $OSTYPE == 'darwin'* ]];
    then
        echo 'macOS \n\n'
    elif [[ $OSTYPE == 'linux'* ]]; 
    then
        echo 'linux \n\n'
    else
        exit;
    fi

    docker run --rm -it -p $1:80 -e TUNNEL_PATH=$3 -e TUNNEL_URL=host.docker.internal:$2/ --name $4 giocavallari/nginx-proxy

fi