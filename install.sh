#!/bin/bash

# functions
function lastPiece {
	for piece in $( echo "$1" | tr " " "\n" ); do
		last=$piece
	done
	echo $last
}

# get the script root path
DIR="$( cd `dirname "$0"` && pwd )"

# verify $1
if [ "$1" == "mac" -o "$1" == "unix" ]; then

	# configure completion path and bash profile name depends on OS given in $1
	if [ "$1" == "mac" ]; then
		COMPLETION_PATH=`brew --prefix`/etc/bash_completion.d/
		BASHFILE="bash_profile"
	else
		COMPLETION_PATH=/etc/bash_completion.d/
		BASHFILE="bashrc"
	fi

	# list
	DOTFILES=(
	$BASHFILE
	vim
	vimrc
	gitconfig
	)

	# uninstall 
	if [ "$2" == "-u" ]; then
		for file in ${DOTFILES[@]}; do
			# remove link dotfiles when it's a symbolic link
			echo $(lastPiece "`ls -ltr ~/.$file`")
			echo $(echo "$DIR"/"$file")
			if [ -h ~/."$file" -a $(lastPiece "`ls -ltr ~/.$file`") == $(echo "$DIR"/"$file") ]; then
				rm ~/."$file"
			fi
		done
		if [ -d "$COMPLETION_PATH" ]; then
			for file in `ls $DIR/bash_completion`; do
				echo $(lastPiece "`ls -ltr $COMPLETION_PATH/$file`")
				echo $(echo "$DIR"/bash_completion/"$file")
				if [ -h "$COMPLETION_PATH"/"$file" -a $(lastPiece "`ls -ltr $COMPLETION_PATH/$file`") == $(echo "$DIR"/bash_completion/"$file") ]; then
					rm "$COMPLETION_PATH"/"$file"
				fi
			done
		fi
	# install
	else
		# link dotfiles
		for file in ${DOTFILES[@]}; do
			ln -s "$DIR"/$file ~/.$file
		done
		# link completions
		if [ -d "$COMPLETION_PATH" ]; then
			sudo ln -s "$DIR"/bash_completion/* "$COMPLETION_PATH"/
		fi
		# initial vim plugins
		cd "$DIR" && git submodule init
		cd "$DIR" && git submodule update
	fi
fi
