#!/bin/bash
sudo apt install -y vim \
	jq \
	ufw \
	nginx \
	snapd \
	apache2-utils

sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot
