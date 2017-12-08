# set path
PATH=${HOME}/bin:/usr/local/bin:/usr/local/sbin:${PATH}

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

setup_completion() {
	COMPLETION_PATH=$1
	# system completion
	if [ -f "${COMPLETION_PATH}" ]; then
		. ${COMPLETION_PATH}
	fi

	# customized completion
	if [ -d ~/.bash_completion.d ]; then
		for file in $(ls ~/.bash_completion.d); do
			. ~/.bash_completion.d/${file}
		done
	fi
}

# system dependent setting
if [[ $(uname) == "Darwin" ]]; then
	setup_completion $(brew --prefix)/etc/bash_completion
	alias ls='ls -vG'
	export EDITOR=vim
else
	setup_completion /etc/bash_completion
	alias ls='ls --color=auto'
fi

# prompt string with git branch display & dirty bit
GIT_PS1_SHOWDIRTYSTATE=1
PS1_WITH_GIT='\[\033[01;34m\]\u\[\033[01;37m\]@\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;31m\]\W\[\033[00m\]$(__git_ps1 "(%s)")\$ '
PS1_WITHOUT_GIT='\[\033[01;34m\]\u\[\033[01;37m\]@\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;31m\]\W\[\033[00m\]\$ '
PS1=${PS1_WITH_GIT}

# alias
alias grep='grep --color=auto'
alias ll='ls -al'
alias la='ls -a'
alias vi='vim'
alias tmux='tmux -2'
alias ps1withoutgit='PS1=${PS1_WITHOUT_GIT}'
alias ps1withgit='PS1=${PS1_WITH_GIT}'

# setup pager
export PAGER="`which less` -s"
export BROWSER="$PAGER"
export LESS_TERMCAP_mb=$'\E[38;5;167m'
export LESS_TERMCAP_md=$'\E[38;5;39m'
export LESS_TERMCAP_me=$'\E[38;5;231m'
export LESS_TERMCAP_se=$'\E[38;5;231m'
export LESS_TERMCAP_so=$'\E[38;5;167m'
export LESS_TERMCAP_ue=$'\E[38;5;231m'
export LESS_TERMCAP_us=$'\E[38;5;167m'

# ignore C-S signal in putty to prevent freezing terminal
stty ixany
stty ixoff -ixon
stty stop undef
stty start undef

# source z jumper
[[ -f ${HOME}/z.sh ]] && source ${HOME}/z.sh

# source local bashrc
[[ -f ${HOME}/.bashrc.local ]] && source ${HOME}/.bashrc.local

# use .inputrc for cmd history search
export INPUTRC=~/.inputrc