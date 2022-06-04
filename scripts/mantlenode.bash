#!/usr/bin/env bash
# shellcheck disable=SC2016

# A simple bash script to install mantlenode in new instances
# usage: bash installation.bash

set -e
set -x

# Installing essential packages
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install gcc make git curl tmux wget

# Installing Golang
go_version=$(curl -L -s https://golang.org/VERSION?m=text)

if [ $(eval type go &>/dev/null | grep -o 'go is') == "go is" ]
    then
        printf "Golang is already installed : version $go_version"
    else
        eval sudo rm -rf /usr/local/go &>/dev/null
        eval wget https://go.dev/dl/${go_version}.linux-amd64.tar.gz &>/dev/null
        eval sudo tar -C /usr/local -xvzf ${go_version}.linux-amd64.tar.gz &>/dev/null

        eval sudo ln -sf /usr/local/go/bin/go /usr/local/bin
        export GOROOT=/usr/local/go
        export GOPATH=$HOME/.go
        export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
        source ~/.bashrc

        echo "export GOPATH=\"\$HOME/.go\"" >> ~/.bashrc
        echo "export GOROOT=\"/usr/local/go\"" >> ~/.bashrc
        echo "export PATH=\"\$PATH:\$GOPATH/bin:\$GOROOT/bin\"" >> ~/.bashrc

fi

# Installing MantleNode
git clone -b v0.3.0 https://github.com/AssetMantle/node.git
cd node
git describe --exact-match --tags $(git log -n1 --pretty='%h')
make install
mantleNode version --long
mantleNode unsafe-reset-all

set +x
# Old MantleNode
#git clone -b 'avkr003/v0.1.1' https://github.com/AssetMantle/node.git
#cd node/
#make all
