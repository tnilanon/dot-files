#!/bin/bash

NEWLINE=$'\n'

old_crontab=$(crontab -l 2>/dev/null)
if [[ ${old_crontab} ]]; then
	old_crontab="${old_crontab}${NEWLINE}"
fi

new_crontab="""${old_crontab}@reboot	sleep 15s; /home/gor/bin/start-notebook-server"""

echo "${new_crontab}" | crontab -


