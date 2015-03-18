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
files=".bash_profile .vimrc tmux .jshint package.json"

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
