#!/usr/bin/env bash

# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04
# https://docs.docker.com/engine/install/ubuntu/

# install docker
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt install -y docker-ce

# https://docs.docker.com/engine/install/linux-postinstall/
# docker doesn't require sudo
sudo usermod -aG docker ${USER}
su - ${USER}

# test installation with
# docker run hello-world
