#!/usr/bin/env bash

temp="${HOME}/.bashrc"
if [[ -f ${temp} && ! -L ${temp} ]]; then
	mv -v ${temp} "${HOME}/.bashrc.local"
fi
temp="${HOME}/.profile"
if [[ -f ${temp} && ! -L ${temp} ]]; then
	mv -v ${temp} "${HOME}/.profile.local"
fi
unset temp

#find ${PWD} -maxdepth 1 -iname ".*" -type f | xargs -I % ln -sv % ${HOME}
#ln -sv ${PWD}/.ssh/config ${HOME}/.ssh/config

file_list=$(find ${PWD} -maxdepth 1 -iname ".*" -type f | sort)
file_list="${file_list} ${PWD}/.ssh/config ${PWD}/ubuntu-upgrade-security-updates.sh"

for file in ${file_list}
do
	file_base=${file#${PWD}/}
	if [[ -L ${HOME}/${file_base} ]]; then
		echo ${file_base} is already linked
	else
		ln -sv ${PWD}/${file_base} ${HOME}/${file_base}
	fi
done


