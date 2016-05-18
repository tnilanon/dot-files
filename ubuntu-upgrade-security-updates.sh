#!/bin/bash

# Ubuntu - upgrade security updates only

TEMP_PREFIX='ubuntu-upgrade-security-updates'

PACKAGE_LIST=$(mktemp -t "${TEMP_PREFIX}.XXXXXXXXXX")

apt-get -s upgrade | grep "^Inst" | grep -i security | awk -F " " {'print $2'} > ${PACKAGE_LIST}

if [[ $(wc -l ${PACKAGE_LIST} | cut -d ' ' -f 1) -eq 0 ]]; then
	echo "No security updates"
	rm ${PACKAGE_LIST}
else
	PACKAGE_STATES_AUTO_LIST=$(mktemp -t "${TEMP_PREFIX}.XXXXXXXXXX")
	PACKAGE_STATES_MANUAL_LIST=$(mktemp -t "${TEMP_PREFIX}.XXXXXXXXXX")
	PACKAGE_STATES_HOLD_LIST=$(mktemp -t "${TEMP_PREFIX}.XXXXXXXXXX")

	apt-mark showauto > ${PACKAGE_STATES_AUTO_LIST}
	apt-mark showmanual > ${PACKAGE_STATES_MANUAL_LIST}
	apt-mark showhold > ${PACKAGE_STATES_HOLD_LIST}

	sudo apt-get install $(cat ${PACKAGE_LIST})
	rm ${PACKAGE_LIST}

	sudo apt-mark auto $(cat ${PACKAGE_STATES_AUTO_LIST})
	sudo apt-mark manual $(cat ${PACKAGE_STATES_MANUAL_LIST})
	sudo apt-mark hold $(cat ${PACKAGE_STATES_HOLD_LIST})

	rm ${PACKAGE_STATES_AUTO_LIST}
	rm ${PACKAGE_STATES_MANUAL_LIST}
	rm ${PACKAGE_STATES_HOLD_LIST}
fi


