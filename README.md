# Hyperledger Fabric 2.1 - ARM64 Edition

Device used for testing Fabric: Raspberry Pi 4 4GB ram.

This repository aims to help all the users that want to install Hyperledger Fabric on ARM64 devices. The ["test-network" example](https://hyperledger-fabric.readthedocs.io/en/release-2.1/test_network.html), that is in [fabric-samples](https://github.com/hyperledger/fabric-samples) repository, seems to work properly without any errors.

Used repositories:
- [fabric](https://github.com/hyperledger/fabric) v2.1.0
- [fabric-baseimage](https://github.com/hyperledger/fabric-baseimage) v0.4.18
- [fabric-samples](https://github.com/hyperledger/fabric-samples) v2.1.0

## Scripts description

These scripts are supposed to work with Ubuntu 20.04.1 LTS 64-bit edition (Desktop or Server, it makes no difference), Zsh shell and the above-mentioned versions of fabric repositories. Feel free to change it for testing with other versions.

1. prerequisites.sh:
    - Upgrades the system
    - Installs all prerequisites for Docker and Docker Compose
    - Installs Docker and Docker-Compose
    - Makes docker runnable for non-root users
    - Creates both the GOPATH directory and environmental variable
    - Reboots the system

2. setup.sh
    - Clones *fabric* and *fabric-base* repositories.	
    - Sets the above-mentioned versions to both the repositories.
    - Applies patch files for both the repositories (avoiding manual editing) and making the Docker images suitable for ARM64 devices.
    - Compiles first the *fabric-baseimage* docker images:
        - fabric-baseimage
        - fabric-baseos
        - kafka
        - couchdb
        - zookeeper
    - Compiles the *fabric* docker images and native binaries:
        - fabric-ccenv
        - fabric-orderer
        - fabric-peer
        - fabric-tools
    - Clones the *fabric-samples* repositories and copies native binarie and configuration (edited before) in its directory.

## How to install Fabric 2.1 ARM64 Edition

1. Run **prerequisites.sh**.
2. Run **setup.sh**.
3. All done.
