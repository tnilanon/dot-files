# .profile
# Load platform-specific environment

if [ ! -z "${BASH_SOURCE_DEBUG+x}" ]; then
  echo 'sourcing .profile'
fi

if [[ -f "${HOME}/.profile.local" ]]; then
	. "${HOME}/.profile.local"
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


