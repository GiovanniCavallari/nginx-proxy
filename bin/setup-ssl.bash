#!/bin/bash

# $1 - DOMAIN_NAME
# $2 - EMAIL
# $3 - CONTAINER_NAME || CONTAINER_ID

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]
then
    echo "USAGE: certbot --nginx -d [DOMAIN_NAME] --non-interactive --agree-tos -m [EMAIL]";
    echo "ERROR: Missing params:";
    echo " - Missing param 1 -> DOMAIN_NAME";
    echo " - Missing param 2 -> EMAIL";
    echo " - Missing param 3 -> CONTAINER_NAME or CONTAINER_ID";
    exit;
fi

docker exec -it $3 apt-get update
docker exec -it $3 apt-get install certbot python3-certbot-nginx -y
docker exec -it $3 certbot --nginx -d $1 --non-interactive --agree-tos -m $2
