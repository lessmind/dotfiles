#!/bin/bash

# functions
function lastPiece {
	for piece in $( echo ${1} | tr " " "\n" ); do
		last=${piece}
	done
	echo ${last}
}

# get the script root path
DIR="$( cd $(dirname "${0}") && pwd )"

# configure completion path and bash profile name depends on OS given in $1
if [ "$(uname)" == "Darwin" ]; then
	BASHFILE="bash_profile"
else
	BASHFILE="bashrc"
fi

# list
DOTFILES=(
${BASHFILE}
vim
vimrc
gitconfig
bash_completion.d
)

# uninstall 
if [ "${1}" == "-u" ]; then
	for file in ${DOTFILES[@]}; do
		# remove link dotfiles when it's a symbolic link
		if [ -h ~/."${file}" -a $(lastPiece "$(ls -ltr ~/.${file})") == $(echo "${DIR}"/"${file}") ]; then
			rm ~/."${file}"
		fi
	done
# install
else
	# link dotfiles
	for file in ${DOTFILES[@]}; do
		if [ ! -h ~/."${file}" -a ! -f ~/."${file}" ]; then
			ln -s "${DIR}"/${file} ~/.${file}
		fi
	done
	# initial vim plugins
	cd "${DIR}" && git submodule init
	cd "${DIR}" && git submodule update
fi
