#!/bin/bash

# $1 - PATH

if [ -z "$1" ]
then
    echo "ERROR: Missing params:";
    echo " - Missing param 1 -> PATH";
    exit;
fi

sudo apt-get install nginx
sudo rm /etc/nginx/sites-enabled/default*
sudo mkdir /etc/nginx/sites-available/tunnel
sudo cp ${PATH}/conf/tunnel.conf /etc/nginx/sites-available/tunnel/
sudo ln -s /etc/nginx/sites-available/tunnel/tunnel.conf /etc/nginx/sites-enabled/
sudo nginx -s reload
