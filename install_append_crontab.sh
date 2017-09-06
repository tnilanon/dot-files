#!/usr/bin/env bash

current_crontab="""$(crontab -l 2>/dev/null)
@reboot	sleep 15s; screen -d -m -S nb /home/gor/start_notebook_server.sh
"""

echo ${current_crontab} | crontab -


