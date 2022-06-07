#!/usr/bin/env bash

# A simple script to install essential tools in debian based servers
# usage: bash installation.bash --help

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
        source $HOME/.bashrc

        echo "export GOPATH=\"\$HOME/.go\"" >> ~/.bashrc
        echo "export GOROOT=\"/usr/local/go\"" >> ~/.bashrc
        echo "export PATH=\"\$PATH:\$GOPATH/bin:\$GOROOT/bin\"" >> ~/.bashrc

fi

declare -A gokits

# Declared installation of Golang based Tools
gokits["ffuf"]="go install -v github.com/ffuf/ffuf@latest"
gokits["httpx"]="go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest"
gokits["nuclei"]="go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest"
gokits["gron"]="go install -v github.com/tomnomnom/gron@latest"

# Installing all Golang based Tools
printf "Installing Golang based tools (${#gokits[@]})\n\n"
go env -w GO111MODULE=auto
go_succeeded=0

# A for loop to install all golang based tools which is in array!
for gokits in "${!gokits[@]}"; do
    go_succeeded=$((go_succeeded + 1))
    eval ${gokits[$gokits]} &>/dev/null
    if [ $? -eq 0 ]
    then
        printf "$gokits installed (${go_succeeded}/${#gokits[@]})\n"
    else
        printf "Unable to install $gokits, try manually with source code (${go_succeeded}/${#gokits[@]})\n"
    fi
done

