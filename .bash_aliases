# .bash_aliases
# Created Thu Sep 6, 2012 7:31:20 PM

# Notes – Useful command
# type -a
# compgen
# id

alias distro='python -c "import platform; print platform.dist()"'
# alias distro='lsb_release -sirc'

alias PythonSimpleHTTPServer='python -m SimpleHTTPServer 8888'

# alias connect-login.cs.unc.edu='ssh gor@login.cs.unc.edu'

# alias connect-aludra.usc.edu='ssh nilanon@aludra.usc.edu'
# alias connect-nunki.usc.edu='ssh nilanon@nunki.usc.edu'

alias connect-beijing.usc.edu='ssh gor@beijing.usc.edu'
alias connect-lille.usc.edu='ssh gor@lille.usc.edu'
alias connect-lisbon.usc.edu='ssh gor@lisbon.usc.edu'
alias connect-melady1.usc.edu='ssh gor@melady1.usc.edu'
alias connect-melady2.usc.edu='ssh gor@melady2.usc.edu'
alias connect-newyork.usc.edu='ssh gor@newyork.usc.edu'
alias connect-sydney.usc.edu='ssh gor@melady-sydney.usc.edu'

alias physionet-download='wget -r -np -l 2 -A html,txt,csv.gz -nH --cut-dirs=3 --user=tanachat.nilanon@gmail.com --ask-password'

function remove-patient-name-from-directory {
	find . -type d -depth 1 | sed 's/\.\/Patient_[0-9]*$//' | sed 's/\.\/\(\(Patient_[0-9]*\).*\)/mv "\1" "\2"/g' | sh
}

function download-patient-data {
	if [ -z "$1" ]; then
		echo "Specify directory"
	else
		rsync -rmltv -f '- ForUpload/' -f '+ */' -f '+ *cpap5csv.csv' -f '+ *CPAP5csv.csv' -f '- *' newyork.usc.edu:/home/gor/ventilator/$1/ /Users/gor/ventilator/$1/
	fi
}


