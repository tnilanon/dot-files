#!/usr/bin/env bash

case ${OSTYPE} in
	msys*|cygwin*)
		for file in .bash_aliases .bash_profile .bashrc .bashrc.windows .profile .profile.windows .vimrc .ssh/config .gitconfig bin/gpg-pinentry-mode-loopback copy_to_home_directory.sh update_dot_files.sh; do
			cp -v ${PWD}/${file} ${HOME}/${file};
		done
		;;
	*)
		echo "This script should only be run on Windows"
		;;
esac


