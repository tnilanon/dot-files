# Load platform-specific environment

case ${OSTYPE} in
	darwin*)	. ~/.profile.darwin ;;
	linux*)		. ~/.profile.linux ;;
	msys*)		echo "No .profile for MinGW" ;;
	cygwin*)	echo "No .profile for Cygwin" ;;
	bsd*)			echo "No .profile for BSD" ;;
	solaris*)	echo "No .profile for Solaris" ;;
	*)				echo "Can't find proper .profile for \$OSTYPE ${OSTYPE}" ;;
esac


