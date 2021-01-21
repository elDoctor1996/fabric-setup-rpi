#!/bin/bash

fabric_base () {
	# Checkout v0.4.18
	echo "Setting repository to version 0.4.18"
	cd $1/fabric-baseimage
	git checkout v0.4.18

	# Edit files
	echo "Editing files for ARM64 images"
	git apply $2/fabric-baseimage.patch

	# Creating docker images
	echo "Compiling docker images for ARM64..."
	sleep 5
	make docker
	make couchdb
	make zookeeper
	make kafka

	cd $2
}

fabric () {

	# Checkout v2.1.0
	echo "Setting repository to version 2.1.0"
	cd $1/fabric
	git checkout v2.1.0

	#Edit files
	echo "Editing files for ARM64 images"
	git apply $2/fabric.patch
	
	# Creating docker images
	make docker
	make native
	cd $2
}

SCRIPT_PWD="$PWD"
HYPERLEDGER="$GOPATH/src/github.com/hyperledger/"
echo "Going to $HYPERLEDGER directory"
cd $HYPERLEDGER
echo "Cloning fabric repository: git clone https://github.com/hyperledger/fabric.git"
git clone https://github.com/hyperledger/fabric.git
echo "Cloning fabric-baseimage repository: git clone https://github.com/hyperledger/fabric-baseimage.git"
git clone https://github.com/hyperledger/fabric-baseimage.git

fabric_base $HYPERLEDGER $SCRIPT_PWD
fabric $HYPERLEDGER $SCRIPT_PWD

cd $HOME
echo "Cloning fabric-samples repository in $HOME/: git clone https://github.com/hyperledger/fabric-samples.git"
git clone https://github.com/hyperledger/fabric-samples.git
echo "Setting repository to version v2.1.0"
cd $HOME/fabric-samples
git checkout v2.1.0
echo "Copying build/bin from $HYPERLEDGER/fabric to $HOME/fabric-samples"
cp -r $HYPERLEDGER/fabric/build/bin $HOME/fabric-samples
echo "Copying the sampleconfig directory from $HYPERLEDGER/fabric/sampleconfig to $HOME/fabric-samples/config"
cp -r $HYPERLEDGER/fabric/sampleconfig $HOME/fabric-samples/config
