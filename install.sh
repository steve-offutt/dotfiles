#!/usr/bin/env zsh
#

# install apps
packages=(zsh vim git build-essential stow tree curl ca-certificates tmux neovim python3-virtualenv ripgrep)
sudo apt update
echo "sudo apt install -y $packages"
sudo apt install -y "${packages[@]}"

# oh-my-zsh setup
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
cp $HOME/.dotfiles/oh-my-zsh-themes/frontcube-ubuntu.zsh-theme $HOME/.oh-my-zsh/themes/
rm $HOME/.zshrc

# check if kubectl exists. install if not
if ! command -v kubectl &> /dev/null
then
    echo "kubectl could not be found"
    # install kubectl https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
    curl -L "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" -o $HOME/kubectl
    curl -L "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256" -o $HOME/kubectl.sha256
    echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
    retVal=$?
    if [ $retVal -ne 0 ]; then
        echo "Error: Validate the kubectl binary against the checksum file"
	exit $retVal
    fi
    sudo install -o root -g root -m 0755 $HOME/kubectl /usr/local/bin/kubectl
    rm $HOME/kubectl $HOME/kubectl.sha256
fi

# install golang
gover="1.22.4"
if ! command -v go &> /dev/null
then
    curl -Lo /tmp/go$gover.linux-amd64.tar.gz https://go.dev/dl/go$gover.linux-amd64.tar.gz
    sudo rm -rf /usr/local/go
    sudo tar -C /usr/local -xzf /tmp/go$gover.linux-amd64.tar.gz
    rm $HOME/go$gover.linux-amd64.tar.gz
fi


# link configs
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
