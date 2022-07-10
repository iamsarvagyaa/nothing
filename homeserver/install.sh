#!/bin/bash

GIT_URL="https://raw.githubusercontent.com/iamsarvagyaa/nothing/master/homeserver"
ZSH_DIR="$HOME/.zsh"

pacman -Syyu
pacman -S gcc make jq git curl wget tmux vim

mkdir -p $ZSH_DIR/src/
mkdir -p $ZSH_DIR/.cache
curl -sL $GIT_URL/zshrc -O .zshrc
curl -sL $GIT_URL/mini-prompt.zsh -O $ZSH_DIR/src/mini-prompt.zsh
curl -sL $GIT_URL/zshenv -O $ZSH_DIR/src/zshenv
curl -sL $GIT_URL/zshfunc -O $ZSH_DIR/src/zshfunc
curl -sL $GIT_URL/zshplugin -O $ZSH_DIR/src/zshplugin

git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_DIR/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_DIR/zsh-syntax-highlighting

chsh -c $(which zsh)