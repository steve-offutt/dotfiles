#!/usr/bin/env bash

dry_run="0"
if [[ $1 == "--dry" ]]; then
    dry_run="1"
fi

log() {
    if [[ $dry_run == "1" ]]; then
        echo "[DRY_RUN]: $1"
    else
        echo "$1"
    fi
}

log "env: $DEV_ENV"

update_files() {
    log "copying over files from: $1"
    pushd $1 &> /dev/null
    (
        configs=`find . -mindepth 1 -maxdepth 1 -type d`
        for c in $configs; do
            directory=${2%/}/${c#./}
            log "    removing: rm -rf $directory"

            if [[ $dry_run == "0" ]]; then
                rm -rf $directory
            fi

            log "    copying env: cp $c $2"
            if [[ $dry_run == "0" ]]; then
                cp -r ./$c $2
            fi
        done

    )
    popd &> /dev/null
}

copy() {
	# check if the destination directory exists
	d=$(dirname $2)
	if [[ ! -d "$d" ]]; then
		log "creating: $d"
		if [[ $dry_run == "0" ]]; then
			mkdir -p $d
		fi
	fi
    log "removing: $2"
    if [[ $dry_run == "0" ]]; then
        rm $2
    fi
    log "copying: $1 to $2"
    if [[ $dry_run == "0" ]]; then
        cp $1 $2
    fi
}

update_files env/.config $HOME/.config

copy zsh/.zshrc $HOME/.zshrc
copy tmux/.tmux.conf $HOME/.tmux.conf
copy oh-my-zsh-themes/frontcube-ubuntu.zsh-theme $HOME/.oh-my-zsh/themes/frontcube-ubuntu.zsh-theme
copy alacritty/.alacritty.toml $HOME/.config/alacritty/alacritty.toml


## link configs
#if [[ -z $STOW_FOLDERS ]]; then
#    STOW_FOLDERS="nvim,tmux,zsh"
#fi
#
#
#if [[ -z $DOTFILES ]]; then
#    DOTFILES=$HOME/.dotfiles
#fi
#
#
#pushd $DOTFILES
#for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
#do
#    echo "stow $folder"
#    stow -D $folder
#    stow $folder
#done
#popd
