#!/bin/bash

GIT_URL="https://raw.githubusercontent.com/iamsarvagyaa/nothing/master/dotfiles/archlinux"
ZSH_DIR="$HOME/.zsh"

pacman -Syyu
pacman -S gcc make tree jq git curl wget tmux vim zsh which docker docker-compose nginx

mkdir -p $ZSH_DIR/src/
mkdir -p $ZSH_DIR/.cache
mkdir -p $HOME/downloads
curl -sL $GIT_URL/zshrc -o .zshrc
curl -sL $GIT_URL/mini-prompt.zsh -o $ZSH_DIR/src/mini-prompt.zsh
curl -sL $GIT_URL/zshenv -o $ZSH_DIR/src/zshenv
curl -sL $GIT_URL/zshfunc -o $ZSH_DIR/src/zshfunc
curl -sL $GIT_URL/zshplugin -o $ZSH_DIR/src/zshplugin

git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_DIR/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_DIR/zsh-syntax-highlighting
git clone https://github.com/iamsarvagyaa/nothing.git $HOME/downloads/nothing

chsh -s $(which zsh)
exit 