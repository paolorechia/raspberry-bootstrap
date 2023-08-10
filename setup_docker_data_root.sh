#!/bin/bash

# Source: https://www.ibm.com/docs/en/z-logdata-analytics/5.1.0?topic=compose-relocating-docker-root-directory

sudo systemctl stop docker
sudo systemctl stop docker.socket
sudo systemctl stop containerd

sudo mkdir -p /ssd/var/lib/docker
sudo mv /var/lib/docker /ssd/var/lib/docker

# Careful, this overwrites previous configuration
sudo sh -c "echo '{ \"data-root\": \"/ssd/var/lib/docker\" }' | jq . > /etc/docker/daemon.json"
