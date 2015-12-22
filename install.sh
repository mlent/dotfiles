#!/bin/bash

# Install everything in /opt
cd /opt

# Install vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Get my color scheme and copy it to my .vim folder
git clone https://github.com/chriskempson/tomorrow-theme.git
cp /opt/vim/colors/Tomorrow.vim ~/.vim/colors/

# Create backups of old files, copy new ones
dir=/opt/dotfiles
old_dir=/opt/dotfiles_old
files=".zshrc .vimrc tmux .tmuxinator .jshint package.json"

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

# Install other stuff
npm install
vim +PluginInstall +qall
gem install tmuxinator

# Symlink pure prompt
git submodule update --init --recursive
ln -s "$PWD/pure/pure.zsh" /usr/local/share/zsh/site-functions/prompt_pure_setup
ln -s "$PWD/pure/async.zsh" /usr/local/share/zsh/site-functions/async

# Prepare go environment
mkdir $HOME/Go
mkdir -p $HOME/Go/src/github.com/mlent
