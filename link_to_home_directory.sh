#!/usr/bin/env bash

temp="${HOME}/.bashrc"
if [[ -f ${temp} && ! -L ${temp} ]]; then
	mv ${temp} "${HOME}/.bashrc.local"
fi
temp="${HOME}/.profile"
if [[ -f ${temp} && ! -L ${temp} ]]; then
	mv ${temp} "${HOME}/.profile.local"
fi
unset temp

find ${PWD} -maxdepth 1 -iname ".*" -type f | xargs -I % ln -s % ${HOME}


