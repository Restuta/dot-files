# git
alias git=hub
alias g=git
alias gs='git status -s'

alias cat='bat -p'

alias remindme='google calendar add'
#for opening man page in a separate window
function manx { if [ $# -eq 1 ] ; then open x-man-page://$1 ; elif [ $# -eq 2 ] ; then open x-man-page://$1/$2 ; fi }
alias show-hidden='defaults write com.apple.finder AppleShowAllFiles -bool YES'
alias hide-hidden='defaults write com.apple.finder AppleShowAllFiles -bool NO'
#several commands run in a loop providing real-time feedback
alias git-auto-lg='while true; do clear; git lg | cat; sleep 2; done'
alias ls-auto='while true; do clear; ls -a | cat; sleep 2; done'
alias git-auto-sts='while true; do clear; git sts | cat; sleep 2; done'

alias grep='grep --ignore-case --color=always'
alias ..='cd ..'


#find files reqursively with the provided name, case-insensitive
alias f='find . -maxdepth 999 -type f -iname'
alias rm-orig='f "*.*orig*" -delete' #removes all *.orig files found in project
#find pathes that matches provided name, case-insesnsitive
alias fp='find . -maxdepth 999 -type f -ipath'
alias garmin-backup='mv -v /Volumes/GARMIN/Garmin/Activities/*.fit ~/Dropbox/GPS\ Routes/Garmin/Activities/'

#list dir sizes (requires "brew install coreutils")
    #last grep param used to higlight "M" for Megabytes from the rest
alias dir-size='du -sh */ | gsort -rh | grep --color -E "M\s|$"'
alias size='du -sh * | gsort -rh | grep --color -E "G\s|$"'

# When using sudo, use alias expansion (otherwise sudo ignores your aliases)
alias sudo='sudo '
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

function anybar { echo -n $1 | nc -4u -w0 localhost ${2:-1738}; }
function anybar2 { echo -n $1 | nc -4u -w0 localhost ${2:-1739}; }

#ember aliases
# alias ember-clean='rm -rf tmp/ bower_components/ node_modules/ dist/;  npm cache clean; bower cache clean'
# alias ember-reinstall='ember-clean && npm install && bower install'

#sublime
alias s='subl'

#ngrok
alias ngrok-restuta-31337='ngrok -authtoken gx68e/64ThwoJLzwgRxH -subdomain=restuta 31337'

#livereload
# alias reload='livereloadx -s -p 31337'
alias reload='browser-sync start --server "." --port 7778 --files="**/*.*"'

#copy current dir path to clipboard
alias cpdir="pwd | tr -d '\n' | pbcopy"

export PATH="$HOME/.yarn/bin:$PATH"

# better formatted docker ps -a Shows all running and stopped containers
alias dps="docker ps -a --format 'table {{.Names}}\t{{.Image}}\t{{.Size}}\t{{.Command}}\t{{.Status}}\t{{.Ports}}'"

alias dc="docker-compose"
alias dcu="docker-compose up"

alias y="yarn"
alias ys="yarn start"

alias nrd="npm run dev"

# git
alias glocal="git lgc remotes/origin/$(git branch | grep \* | cut -d ' ' -f2)..HEAD"

# run ava debugger, ava-dbg "file/name"
alias ava-dbg="node --inspect node_modules/ava/profile.js"

alias fh="history | awk '{\$1=\"\";print}' | fzf --tac --no-sort | awk '{\$1=\$1;print}' | pbcopy"

# toast
alias run-prod-script="heroku run bash -a toast-prod"
