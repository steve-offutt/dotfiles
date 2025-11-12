#!/usr/bin/env bash
#

# install apps
echo "Installing apps"
./pkgs/apt.sh

# oh-my-zsh setup
echo "Installing oh-my-zsh"
./pkgs/oh-my-zsh.sh

# install neovim
echo "Installing neovim"
./pkgs/neovim.sh

# install nvm
echo "Installing nvm"
./pkgs/nvm.sh

# install kubectl
echo "Installing kubectl"
./pkgs/kubectl.sh

# install golang
echo "Installing golang"
./pkgs/golang.sh

# install nerd-font
echo "Installing nerd-font"
./pkgs/nerd-font.sh
