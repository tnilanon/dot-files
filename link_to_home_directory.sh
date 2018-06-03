#!/usr/bin/env bash

temp="${HOME}/.bashrc"
if [[ -f ${temp} && ! -L ${temp} ]]; then
	echo '>>> Preserving existing local file'
	mv -v ${temp} "${HOME}/.bashrc.local"
fi
temp="${HOME}/.profile"
if [[ -f ${temp} && ! -L ${temp} ]]; then
	echo '>>> Preserving existing local file'
	mv -v ${temp} "${HOME}/.profile.local"
fi
unset temp

#find ${PWD} -maxdepth 1 -iname ".*" -type f | xargs -I % ln -sv % ${HOME}
#ln -sv ${PWD}/.ssh/config ${HOME}/.ssh/config

file_list=$(find ${PWD} -maxdepth 1 -iname ".*" -type f | sort)
file_list="${file_list} ${PWD}/.config/pip/pip.conf ${PWD}/.ipython/profile_default/startup/01-jupyterthemes-plot-style.ipy ${PWD}/.ssh/config ${PWD}/start_notebook_server.sh ${PWD}/update_dot_files.sh"
case ${OSTYPE} in
	linux*)	file_list="${file_list} ${PWD}/ubuntu-upgrade-security-updates.sh" ;;
	*)			echo 'skipping ubuntu-upgrade-security-updates.sh as it is specific to Ubuntu' ;;
esac

for file in ${file_list}
do
	src_rel_file_path=${file#${PWD}/}
	tgt_rel_file_path=${src_rel_file_path}
	# redirect pip config path on MacOS
	case ${OSTYPE} in
		darwin*) tgt_rel_file_path=${tgt_rel_file_path/#.config\/pip/Library\/Application Support\/pip} ;;
	esac
	tgt_file_path=${HOME}/${tgt_rel_file_path}
	if [[ -L ${tgt_file_path} ]]; then
		echo "found: ${tgt_file_path}"
	else
		echo "linking new file: ${tgt_file_path}"
		tgt_file_dir=$(dirname ${tgt_file_path})
		if [[ ${tgt_file_dir} != '.' && ! -e ${tgt_file_dir} ]]; then
			mkdir -pv ${tgt_file_dir}
		fi
		ln -sv ${file} ${tgt_file_path}
	fi
done


