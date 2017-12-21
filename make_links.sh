#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=$PWD                    # dotfiles directory
olddir=$dir/dotfiles_old    # old dotfiles backup directory
files=".bash_profile .vimrc .vim .tmux.conf"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in $olddir"
mkdir -p $olddir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    printf "Saving old ~/$file if it exists\n"
    if [ -f ~/$file ]
    then
        cp -r ~/$file $olddir
    fi
    printf "Creating symlink to $file in home directory.\n"
    ln -fs $dir/$file ~/$file
done
