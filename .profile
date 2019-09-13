# .profile
# Set environment and load platform-specific environment

#export BASH_SOURCE_DEBUG='y'

if [ ! -z "${GOR_PROFILE+x}" ]; then
	if [ ! -z "${BASH_SOURCE_DEBUG+x}" ]; then
		echo 'skipping .profile; not good to source it multiple times :('
	fi
else
	if [ ! -z "${BASH_SOURCE_DEBUG+x}" ]; then
		echo 'sourcing .profile'
	fi

	export GPGKEY="1DE788C7A9B3B34E"

	export PATH="${HOME}/bin:${PATH}"

	if [[ -f "${HOME}/.profile.local" ]]; then
		if [ ! -z "${BASH_SOURCE_DEBUG+x}" ]; then
			echo 'sourcing .profile.local'
		fi
		. "${HOME}/.profile.local"
		if [ ! -z "${BASH_SOURCE_DEBUG+x}" ]; then
			echo 'done sourcing .profile.local'
		fi
	fi

	case ${OSTYPE} in
		darwin*)	. "${HOME}/.profile.darwin" ;;
		linux*)		. "${HOME}/.profile.linux" ;;
		msys*)		. "${HOME}/.profile.windows" ;;
		cygwin*)	echo "No specific .profile for Cygwin" ;;
		bsd*)			echo "No specific .profile for BSD" ;;
		solaris*)	echo "No specific .profile for Solaris" ;;
		*)				echo "Can't recognize \${OSTYPE} ${OSTYPE} for .profile" ;;
	esac

	GOR_PROFILE='y'
	if [ ! -z "${BASH_SOURCE_DEBUG+x}" ]; then
		echo 'done sourcing .profile'
	fi
fi


