# dot-files

## Setting up symlinks

example `ln -s /any/file/on/the/disk linked-file`

Run `./deploy.sh`


## Other Setups


## Brew

```
brew install git
brew install hub
brew install gh
brew install zsh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

brew zsh-completions
brew install zsh-syntax-highlighting

brew install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

git clone https://github.com/supercrabtree/k $ZSH_CUSTOM/plugins/k

brew install fzf
# gsort and etc
brew install coreutils
# text interface for git
brew install tig
brew install bat
brew install awscli

# make zsh default shell
# before you do this you might need to modify /etc/shells
# to include /opt/homebrew/bin/zsh
chsh -s $(which zsh)

# pure prompt
npm install --global pure-prompt

# diff so fancy
npm i -g diff-so-fancy
git config --global core.pager "diff-so-fancy | less --tabs=2 -RFX"


```
