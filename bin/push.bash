#!/bin/bash

# $1 - Image tag

if [ -z "$1" ]
then
    echo "USAGE: docker push giocavallari/nginx-proxy:[TAG]";
    echo "ERROR: Missing tag param";
    exit;
fi

docker push giocavallari/nginx-proxy:$1
