#!/bin/bash
sudo apt install -y vim \
	jq \
	ufw \
	nginx \
	snapd  

sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot
