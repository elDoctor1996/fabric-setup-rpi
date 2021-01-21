#!/bin/bash

if [ $# -ne 0 ];then
	echo "Program use: $0 and no arguments"
	exit 1
fi

echo "sudo apt-get dist-upgrade -y\n\n\n"
sudo apt-get dist-upgrade -y
echo "\n\n\nsudo apt-get install -y golang python3 git curl build-essential nodejs npm pipenv default-jdk\n\n\n"
sudo apt-get install -y golang python3 git curl build-essential nodejs npm pipenv default-jdk
echo "\n\n\nsudo curl -fsSL https://get.docker.com | sh\n\n\n"
sudo curl -fsSL https://get.docker.com | sh
echo "\n\n\nsudo usermod -aG docker $USER\n\n\n"
sudo usermod -aG docker $USER
echo "\n\n\nsudo apt-get install -y docker-compose\n\n\n"
sudo apt-get install -y docker-compose
echo "\n\n\nmkdir -p $HOME/go/src/github.com/hyperledger\n\n\n"
mkdir -p $HOME/go/src/github.com/hyperledger
echo "echo \"export GOPATH=$HOME/go\" >> .zshenv"
echo "export GOPATH=$HOME/go" >> $HOME/.zshenv
sudo reboot
