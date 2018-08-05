#!/bin/bash

# Install everything in /opt
cd /opt

# Install vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Get my color scheme and copy it to my .vim folder
git clone https://github.com/chriskempson/tomorrow-theme.git
cp /opt/vim/colors/Tomorrow.vim ~/.vim/colors/

# Install nix package manager
curl https://nixos.org/nix/install | sh

# Create backups of old files, copy new ones
dir=/opt/dotfiles
old_dir=/opt/dotfiles_old
files=".zshrc .vimrc tmux .eslintrc.js .tmuxinator .tmux.conf package.json"

echo "Creating backup in $olddir"
mkdir -p $olddir

echo "Opening $dir"
cd $dir

for file in $files; do
  echo "Moving old version of $file"
  mv ~/$file /opt/dotfiles_old/
  echo "Symlinking $file"
  ln -s $dir/$file ~/$file
done

# Install vim plugins
vim +PluginInstall +qall

# Tmux, tmuxinator
nix-env -i tmux
nix-env -i tmuxinator
nix-env -i coreutils

# Set up pure prompt
nix-env -i yarn
yarn
git submodule update --init --recursive
ln -s "$PWD/pure/pure.zsh" /usr/local/share/zsh/site-functions/prompt_pure_setup
ln -s "$PWD/pure/async.zsh" /usr/local/share/zsh/site-functions/async

# Zsh completions and suggestions
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# Prepare go environment
mkdir $HOME/Go
mkdir -p $HOME/Go/src/github.com/mlent

# Prepare node environment
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

# Set up eslint global fallback
cd ~ && yarn
