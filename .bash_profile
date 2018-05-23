# .bash_profile
# Created by Tanachat Nilanon
# Thu Aug 11, 2011 9:43:52 AM

#export BASH_SOURCE_DEBUG='y'

if [ ! -z "${GOR_BASH_PROFILE+x}" ]; then
	if [ ! -z "${BASH_SOURCE_DEBUG+x}" ]; then
		echo 'sourcing .bash_profile multiple times :('
	fi
else
	if [ ! -z "${BASH_SOURCE_DEBUG+x}" ]; then
		echo 'sourcing .bash_profile'
	fi
fi
export GOR_BASH_PROFILE='y'

# http://superuser.com/questions/789448/choosing-between-bashrc-profile-bash-profile-etc
#
# ~/.bash_profile should be super-simple and just load .profile and .bashrc (in that order)
# ~/.profile has the stuff NOT specifically related to bash, such as environment variables (PATH and friends)
# ~/.bashrc has anything you'd want at an interactive command line. Command prompt, EDITOR variable, bash aliases for my use
#
# A few other notes:
#
# Anything that should be available to graphical applications OR to sh (or bash invoked as sh) MUST be in ~/.profile
# ~/.bashrc must not output anything
# Anything that should be available only to login shells should go in ~/.profile
#
# See also: http://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/

if [[ -f "${HOME}/.profile" ]]; then
	. "${HOME}/.profile"
fi

# Note to self: . is the same as source
# .bashrc automatically loads the aliases and functions from .bash_aliases

if [[ -f "${HOME}/.bashrc" ]]; then
	. "${HOME}/.bashrc"
fi

if [ ! -z "${BASH_SOURCE_DEBUG+x}" ]; then
	echo 'done sourcing .bash_profile'
fi


