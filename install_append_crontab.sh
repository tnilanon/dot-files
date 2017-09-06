#!/usr/bin/env bash

(crontab -l; echo "@reboot	sleep 15s; screen -d -m -S nb /home/gor/start_notebook_server.sh") | crontab -


