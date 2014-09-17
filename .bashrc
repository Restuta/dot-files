alias git=hub
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
#favorites
alias cd-mobile='cd ~/Projects/Ingenio/git-svn-trunk-direct/trunk/SRC/Keen/Keen.Mobile.Web'

#find files reqursively with the provided name, case-insensitive
alias f='find . -maxdepth 999 -type f -iname'
#find pathes that matches provided name, case-insesnsitive
alias fp='find . -maxdepth 999 -type f -ipath'
alias garmin-backup='mv /Volumes/GARMIN/Garmin/Activities/*.fit ~/Dropbox/GPS\ Routes/Garmin/Activities/'

# When using sudo, use alias expansion (otherwise sudo ignores your aliases)
alias sudo='sudo '