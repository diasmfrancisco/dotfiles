#! /bin/bash

# .make.sh
# This script install custom plugins for zsh

# VARIABLES

cust=~/roles/dotfiles/oh-my-zsh/custom

# List of plugins so far are: 
# 1. git
# 2. zsh-autosuggestions
# 3. zsh-completions
# 4. zsh-syntax-highlighting

# MAKE CUST DIRECTORY FOR PLUGINS!

echo "Making plugins path within $cust directory..."
mkdir -p $cust/plugins

# INSTALL CUSTOM PLUGINS
echo "Git cloning zsh-autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions $cust/plugins/zsh-autosuggestions
echo "... done!"

echo "Git cloning zsh-completions..."
git clone https://github.com/zsh-users/zsh-completions $cust/plugins/zsh-completions
echo "... done!"

echo "Git cloning zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $cust/plugins/zsh-syntax-highlighting
echo "... done!"
