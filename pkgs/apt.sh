#!/usr/bin/env bash

# install apps
packages=(zsh vim git build-essential stow tree curl ca-certificates tmux neovim python3-virtualenv ripgrep)
sudo apt update
echo "sudo apt install -y $packages"
sudo apt install -y "${packages[@]}"
