#!/usr/bin/env bash

case ${OSTYPE} in
	msys*|cygwin*)
		find ${PWD} -maxdepth 1 -iname ".*" -type f | xargs -I % cp -v % ${HOME}
		cp -v ${PWD}/.config/pip/pip.conf ${HOME}/.config/pip/pip.conf
		cp -v ${PWD}/.ipython/profile_default/startup/01-jupyterthemes-plot-style.ipy ${HOME}/.ipython/profile_default/startup/01-jupyterthemes-plot-style.ipy
		cp -v ${PWD}/.ssh/config ${HOME}/.ssh/config
		cp -v ${PWD}/start_notebook_server.sh ${HOME}/start_notebook_server.sh
		cp -v ${PWD}/update_dot_files.sh ${HOME}/update_dot_files.sh
		;;
	*)
		echo "This script should only be run on Windows"
		;;
esac


