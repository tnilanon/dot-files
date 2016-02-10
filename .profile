# Load platform-specific environment

if [[ -f "${HOME}/.profile.local" ]]; then
	. "${HOME}/.profile.local"
fi

case ${OSTYPE} in
	darwin*)	. ~/.profile.darwin ;;
	linux*)		. ~/.profile.linux ;;
	msys*)		echo "No specific .profile for MinGW" ;;
	cygwin*)	echo "No specific .profile for Cygwin" ;;
	bsd*)			echo "No specific .profile for BSD" ;;
	solaris*)	echo "No specific .profile for Solaris" ;;
	*)				echo "Can't find specific .profile for \$OSTYPE ${OSTYPE}" ;;
esac


