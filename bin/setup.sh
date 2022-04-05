#!/bin/bash

sudo apt-get install nginx
sudo rm /etc/nginx/sites-enabled/default
sudo mkdir /etc/nginx/sites-available/tunnel
sudo cp dev/nginx-proxy/conf/tunnel.conf /etc/nginx/sites-available/tunnel/
sudo ln -s /etc/nginx/sites-available/tunnel /etc/nginx/sites-enabled/tunnel 
sudo nginx -s reload
