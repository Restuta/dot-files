#!/bin/sh

#ln -s FILE_TO_SET_LINK_TO PATH_TO_SYMLINK

ln -s $(pwd)/.bash_profile ~/.bash_profile
ln -s $(pwd)/.bashrc ~/.bashrc
ln -s $(pwd)/.zshrc ~/.zshrc
ln -s $(pwd)/.fzf.zsh ~/.fzf.zsh
ln -s $(pwd)/git-completion.bash ~/git-completion.bash
ln -s $(pwd)/git-prompt.sh ~/git-prompt.sh
ln -s $(pwd)/.gitconfig ~/.gitconfig

# VS Code
ln -s $(pwd)/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s $(pwd)/vscode/snippets/restuta.code-snippets ~/Library/Application\ Support/Code/User/snippets/restuta.code-snippets


ln -s $(pwd)/sublime/tasks-custom.hidden-tmTheme ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/PlainTasks/tasks-custom.hidden-tmTheme

# sometimes sublime is installed in just "Sublime Text" directory w/o the version number 
ln -s $(pwd)/sublime/tasks-custom.hidden-tmTheme ~/Library/Application\ Support/Sublime\ Text\/Packages/PlainTasks/tasks-custom.hidden-tmTheme

ln -s $(pwd)/key-bindings.zsh /opt/homebrew/opt/fzf/shell/key-bindings.zsh



