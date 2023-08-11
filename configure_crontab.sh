#!/bin/bash

echo "Make sure to enable crontab first with crontab -e"

(crontab -l ; echo "*/5 * * * * python3 /home/pi/ionos_request.py >> log_ionos.log") | sort - | uniq - | crontab -

echo "Your crontab: "
crontab -l

cp ionos_script.py /home/pi/ionos_request.py

