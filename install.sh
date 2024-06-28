#!/usr/bin/env zsh
#

# install apps
packages=(vim git build-essential stow tree curl zsh)
sudo apt update
echo "sudo apt install -y $packages"
sudo apt install -y "${packages[@]}"


if [[ -z $STOW_FOLDERS ]]; then
    STOW_FOLDERS="nvim,tmux,zsh"
fi


if [[ -z $DOTFILES ]]; then
    DOTFILES=$HOME/.dotfiles
fi


pushd $DOTFILES
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    echo "stow $folder"
    stow -D $folder
    stow $folder
done
popd
