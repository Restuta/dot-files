#!/bin/sh

#ln -s FILE_TO_SET_LINK_TO PATH_TO_SYMLINK

ln -s $(pwd)/.bash_profile ~/.bash_profile
ln -s $(pwd)/.bashrc ~/.bashrc
ln -s $(pwd)/.zshrc ~/.zshrc
ln -s $(pwd)/git-completion.bash ~/git-completion.bash
ln -s $(pwd)/git-prompt.sh ~/git-prompt.sh
ln -s $(pwd)/.gitconfig ~/.gitconfig
ln -s $(pwd)/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s $(pwd)/sublime/tasks-custom.hidden-tmTheme ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/PlainTasks/tasks-custom.hidden-tmTheme
