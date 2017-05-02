export PATH=/usr/local/bin:$PATH
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

source ~/git-completion.bash #git's autocompletion script
source ~/git-prompt.sh #git prompt support (allows to see git current branch name in the prompt)
source ~/.bashrc  # get aliases

#GIT_PS1_SHOWDIRTYSTATE=true 	#	* unstaged +staged
GIT_PS1_SHOWSTASHSTATE=true 	#	$ stashed
#GIT_PS1_SHOWUNTRACKEDFILES=true #	% untraked
GIT_PS1_SHOWUPSTREAM=true		#	< behind, > ahead, <> diverged, = no difference
#GIT_PS1_SHOWUPSTREAM="verbose name"		#	< behind, > ahead, <> diverged, = no difference
GIT_PS1_SHOWCOLORHINTS=true

#export PS1='\[\e[0;31m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;37m\]\w\[\e[0m\]\n\$ '
export PS1='\[\e[00;31m\]\u\[\e[0m\]@\[\e[00;32m\]\h\[\e[0m\]:\[\e[0;37m\]\w\[\e[0m\]\[\e[03;33m\]$(__git_ps1 " (%s)")\e[0m\]\n\$ '
#export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ 'source /Users/Restuta/.iterm2_shell_integration.bash

export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it
