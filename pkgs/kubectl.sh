#!/usr/bin/env bash

# check if kubectl exists. install if not
if ! command -v kubectl &> /dev/null
then
    echo "kubectl could not be found"
    # install kubectl https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
    curl -L "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" -o $HOME/kubectl
    curl -L "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256" -o $HOME/kubectl.sha256
    echo "$(cat $HOME/kubectl.sha256)  $HOME/kubectl" | sha256sum --check
    retVal=$?
    if [ $retVal -ne 0 ]; then
        echo "Error: Validate the kubectl binary against the checksum file"
	exit $retVal
    fi
    sudo install -o root -g root -m 0755 $HOME/kubectl /usr/local/bin/kubectl
    rm $HOME/kubectl $HOME/kubectl.sha256
fi
