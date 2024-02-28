# raspberry-bootstrap
This repository contains some simple bash scripts to configure a Raspberry with the following:

- NGINX web server with SSL certificate
- A IONOS script to update the A record with the current Raspberry IP Address, every 5 minutes.
- Basic docker setup.
- NGINX web servers configuration, serving two subdomains, one for a regular website, another for a private docker registry.


Nothing groundbreaking, but since I've configured this recently, it's useful having a backup script in case I need to reformat the device.
