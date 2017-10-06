#!/bin/bash

current_crontab="""$(crontab -l 2>/dev/null)
@reboot	sleep 15s; /home/gor/start_notebook_server.sh
"""

echo "${current_crontab}" | crontab -


