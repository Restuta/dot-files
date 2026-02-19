# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/bash_profile.pre.bash" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/bash_profile.pre.bash"
# Q pre block. Keep at the top of this file.
export PATH=/usr/local/bin:$PATH
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

source ~/git-completion.bash #git's autocompletion script
source ~/git-prompt.sh #git prompt support (allows to see git current branch name in the prompt)
source ~/.bashrc  # get aliases
source ~/.divvy.sh # Divvy speicific aliases
# source ~/.profile # rvm (Ruby version manager) variables

#GIT_PS1_SHOWDIRTYSTATE=true 	#	* unstaged +staged
GIT_PS1_SHOWSTASHSTATE=true 	#	$ stashed
#GIT_PS1_SHOWUNTRACKEDFILES=true #	% untraked
GIT_PS1_SHOWUPSTREAM=true		#	< behind, > ahead, <> diverged, = no difference
#GIT_PS1_SHOWUPSTREAM="verbose name"		#	< behind, > ahead, <> diverged, = no difference
GIT_PS1_SHOWCOLORHINTS=true

#export PS1='\[\e[0;31m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;37m\]\w\[\e[0m\]\n\$ '
# export PS1='\[\e[00;31m\]\u\[\e[0m\]@\[\e[00;32m\]\h\[\e[0m\]:\[\e[0;37m\]\w\[\e[0m\]\[\e[03;33m\]$(__git_ps1 " (%s)")\e[0m\]\n\$ '
#export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ 'source /Users/Restuta/.iterm2_shell_integration.bash

export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

PATH=$PATH:/usr/local/sbin
# added by Anaconda3 2019.10 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/opt/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

PATH=$PATH:/usr/local/sbin
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
. "$HOME/.cargo/env"

export PATH="/Users/restuta/.local/share/solana/install/active_release/bin:$PATH"

# Q post block. Keep at the bottom of this file.

# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/bash_profile.post.bash" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/bash_profile.post.bash"
