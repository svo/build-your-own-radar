#!/bin/bash

sudo apt-get -y update &&
sudo apt-get install -y python3 python3-pip expect sshpass &&

sudo -H pip3 install --upgrade pip &&
sudo -H pip3 install --upgrade cryptography &&
sudo -H pip3 install ansible &&

echo "[defaults]" > ~/.ansible.cfg &&
echo "host_key_checking = False" >> ~/.ansible.cfg &&

cd /vagrant/ &&

bash/setup-guest-additions.sh &&
bash/self-provision.sh
