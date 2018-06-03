#!/usr/bin/env bash
# update_dot_files.sh

cd "${HOME}/codes/dot-files"
git update
case ${OSTYPE} in
	darwin*)  './link_to_home_directory.sh' ;;
	linux*)   './link_to_home_directory.sh' ;;
	msys*)    './copy_to_home_directory.sh' ;;
	cygwin*)  './copy_to_home_directory.sh' ;;
	bsd*)     './link_to_home_directory.sh' ;;
	solaris*) './link_to_home_directory.sh' ;;
	*)        echo "Can't recognize \${OSTYPE} ${OSTYPE} in update_dot_files.sh" ;;
esac


