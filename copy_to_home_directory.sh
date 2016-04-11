#!/usr/bin/env bash

case ${OSTYPE} in
	msys*|cygwin*)
		find ${PWD} -maxdepth 1 -iname ".*" -type f | xargs -I % cp -v % ${HOME}
		cp -v ${PWD}/.ssh/config ${HOME}/.ssh/config
		;;
	*)
		echo "This script should only be run on Windows"
		;;
esac


