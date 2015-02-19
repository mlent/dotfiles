#!/bin/bash

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

npm install
