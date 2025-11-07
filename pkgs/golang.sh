#!/usr/bin/env bash

gover="1.24.2"
goverstr="go$gover"
should_install=false
goexists=$(command -v go)
if [[ -n "$goexists" ]]; then
	# check the version of go matches the one we want
	# if it doesn't, set should_install to true
	installed_version=$(go version | awk '{print $3}' | cut -d. -f1,2,3)
	echo "installed version: $installed_version"
	if [[ "$installed_version" != "$goverstr" ]]; then
		should_install=true
	else
		echo "go version $installed_version matches, not installing"
	fi
else
	# go does not exist, set should_install to true
	echo "go does not exist, installing"
	should_install=true
fi

if [[ "$should_install" == "true" ]]; then
	echo "installing go $gover"
	filename="/tmp/go$gover.linux-amd64.tar.gz"
    curl -Lo $filename https://go.dev/dl/go$gover.linux-amd64.tar.gz
    sudo rm -rf /usr/local/go
    sudo tar -C /usr/local -xzf $filename
	rm $filename
fi

