#!/bin/bash

PATH=$1

sudo apt-get install nginx
sudo rm /etc/nginx/sites-enabled/default*
sudo mkdir /etc/nginx/sites-available/tunnel
sudo cp ${PATH}/conf/tunnel.conf /etc/nginx/sites-available/tunnel/
sudo ln -s /etc/nginx/sites-available/tunnel/tunnel.conf /etc/nginx/sites-enabled/
sudo nginx -s reload
