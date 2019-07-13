#! /bin/bash

# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles

# VARIABLES

# dotfiles directory
dir=~/roles/dotfiles

# backup directory for old dotfiles
backup=~/roles/dotfiles_old

# list of files/folders to symlink in homedir
files="bash_profile tmux.conf vimrc zshrc vim oh-my-zsh"


###########

# Create dotfiles_old in home directory
echo "Creating $backup for backup of any existing dotfiles in ~"
mkdir -p $backup
echo "... done!"

# Change to the dotfiles directory
echo "Changing working directory to the dotfiles directory"
cd $dir
echo "... done!"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks in homedir
for file in $files; do
	echo "Moving any existing dotfiles from ~ to $backup"
	mv ~/.$file ~/roles/dotfiles_old/
	echo "Creating symlink to $file in home directory"
	ln -s -f $dir/$file ~/.$file
done
