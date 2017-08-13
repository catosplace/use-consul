#! /bin/sh -x

echo "Installing dependencies ..."
sudo apt-get update > /dev/null
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y unzip curl jq

echo "Installing Python Pip"
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y python-pip

# Update pip version
sudo pip install --upgrade pip

echo "Installing Ansible, Docker and Molecule..."
sudo pip install ansible
sudo pip install docker
sudo pip install molecule
