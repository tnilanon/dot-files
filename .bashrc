# .bashrc

# Check for interactive mode to avoid breaking things like sftp on Debian
# (where bash is compiled with the option to load ~/.bashrc
# even for non-interactive shells)
[[ $- == *i* ]] || return 0

# This enables forward history search using Ctrl-S
if [[ $- =~ i ]]; then
  stty -ixon
fi

# Syntactic sugar for ANSI escape sequences
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
undblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
bakgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
hiblk='\e[0;90m'  # Black - High Intensity
hired='\e[0;91m'  # Red
higrn='\e[0;92m'  # Green
hiylw='\e[0;93m'  # Yellow
hiblu='\e[0;94m'  # Blue
hipur='\e[0;95m'  # Purple
hicyn='\e[0;96m'  # Cyan
hiwht='\e[0;97m'  # White
txtrst='\e[0m'    # Text Reset

# Prompt variables
PROMPT_BEFORE="${bldred}\u ${txtpur}\h ${bldblu}\V ${txtcyn}\D{%b %d} ${txtwht}\A ${bldgrn}\W${txtrst}"
PROMPT_AFTER="\n${hiylw}\\$ ${txtrst}"

# Prompt command
PROMPT_COMMAND='__git_ps1 "$PROMPT_BEFORE" "$PROMPT_AFTER"'

# Git prompt features (read ~/.git-prompt.sh for reference)
export GIT_PS1_SHOWDIRTYSTATE="true"
export GIT_PS1_SHOWSTASHSTATE="true"
export GIT_PS1_SHOWUNTRACKEDFILES="true"
export GIT_PS1_SHOWUPSTREAM="auto"
#export GIT_PS1_SHOWCOLORHINTS="true"
export GIT_PS1_HIDE_IF_PWD_IGNORED="true"

#export PS1="\[\e[0;36m\][\[\e[0;32m\]\\u@\\h \[\e[0;35m\]\\s \\V \[\e[0;37m\]\\@\[\e[0;36m\]] \[\e[0;31m\]\\W \[\e[0;33m\]\\$ \[\e[m\]"
#export PS1="\[\e[0;36m\][\[\e[0;32m\]\\u@\[\e[4;32m\]\\h\[\e[m\] \[\e[0;35m\]\\s \\V \[\e[0;37m\]\\@\[\e[0;36m\]] \[\e[1;31m\]\\W \[\e[0;93m\]\\$ \[\e[m\]"
#export PS1="\[\e[0;32m\]\\u@\[\e[4;32m\]\\h\[\e[m\] \[\e[0;35m\]\\s \[\e[0;36m\]\\D{%a %d} \[\e[0;37m\]\\A \[\e[1;31m\]\\W \[\e[0;93m\]\\$ \[\e[m\]"
#export PS1="\[\e[0;32m\]\\u \[\e[0;35m\]\\h \[\e[0;36m\]\\D{%a %b %d} \[\e[0;37m\]\\A \[\e[1;31m\]\\W \[\e[0;93m\]\\$ \[\e[m\]"
#export PS1="${SHLVL} \[\e[1;32m\]\\u \[\e[0;35m\]\\h \[\e[1;34m\]\\V \[\e[0;36m\]\\D{%a %d} \[\e[0;37m\]\\A \[\e[1;31m\]\\W \[\e[0;93m\]\\$ \[\e[m\]"
#export PS1="\[\e[1;32m\]\\u \[\e[0;35m\]\\h \[\e[1;34m\]\\V \[\e[0;36m\]\\D{%a %d} \[\e[0;37m\]\\A \[\e[1;31m\]\\W \[\e[0;93m\]\\$ \[\e[m\]"
#export PS1="\[\e[1;31m\]\\u \[\e[0;35m\]\\h \[\e[1;34m\]\\V \[\e[0;36m\]\\D{%a %d} \[\e[0;37m\]\\A \[\e[1;32m\]\\W \[\e[0;93m\]\\$ \[\e[m\]"

if [[ -f ~/.bash_aliases ]]; then
	. ~/.bash_aliases
fi


