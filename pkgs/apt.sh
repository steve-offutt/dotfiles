#!/usr/bin/env bash

# install apps
packages=(zsh lsd vim git build-essential tree curl ca-certificates tmux python3-virtualenv ripgrep)
sudo apt update
echo "sudo apt install -y $packages"
sudo apt install -y "${packages[@]}"
