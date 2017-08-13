#! /bin/sh -x

echo "Installing docker ..."
sudo apt-get update > /dev/null
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual
curl -fsSL get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker vagrant
