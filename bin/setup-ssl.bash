#!/bin/bash

# $1 - DOMAIN_NAME
# $2 - EMAIL
# $3 - CONTAINER_NAME || CONTAINER_ID

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]
then
    echo "USAGE: certbot --nginx -d [DOMAIN_NAME] --non-interactive --agree-tos --redirect -m [EMAIL]";
    echo "ERROR: Missing params:";
    echo " - Missing param 1 -> DOMAIN_NAME";
    echo " - Missing param 2 -> EMAIL";
    echo " - Missing param 3 -> CONTAINER_NAME or CONTAINER_ID";
    exit;
fi

echo "Accessing container $3... \n"

echo "Running apt-get update...";
docker exec -it $3 apt-get update
if [ $? -eq 0 ]; then
    echo "\033[01;32mExecuted successfully \n \033[0m";
else
    exit;
fi

echo "Installing certbot...";
docker exec -it $3 apt-get install certbot python3-certbot-nginx -y
if [ $? -eq 0 ]; then
    echo "\033[01;32mExecuted successfully \n \033[0m";
else
    exit;
fi

echo "Installing certbot ssl..."
docker exec -it $3 certbot --nginx -d $1 --non-interactive --agree-tos --redirect -m $2
if [ $? -eq 0 ]; then
    echo "\033[01;32mExecuted successfully \n \033[0m";
else
    exit;
fi

