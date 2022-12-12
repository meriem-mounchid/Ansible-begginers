#!/bin/sh

### PRE-Instalation ###
sudo apt update
sudo apt install vim openssh-server -y
sudo usermod -aG sudo misaki

# Install Docker if not installed
if [ ! "$(command -v docker &> /dev/null)" ]
then
    echo "* * * * Installing Docker * * * *"
    sudo apt install docker.io -y
    sudo usermod -aG docker misaki
    # newgrp docker
else
    echo "* * * * Docker already installed * * * *"
fi

# Install Ansible if not installed
if [ ! "$(command -v ansible &> /dev/null)" ]
then
    echo "Installing Ansible"
    sudo apt-get update
    sudo apt-add-repository -y ppa:ansible/ansible
    sudo apt-get update
    sudo apt-get install -y ansible vim
    sudo pip install boto boto3
    sudo apt install python-pip -y
    # pip list boto | grep boto
else
    echo "Ansible already installed"
fi

# Still working on it
# while true; do
# read -p "Do You Want To Install Docker? (yes/no) " yn
# case $yn in
#         [yY] ) echo Start Installing Docker;
#             break;;
#         [Nn] ) echo no;
#             echo Skipping Docker Installation;
#             break;;
#         * ) echo "Invalid Response , Try Again With (y/n) ";;
# esac
# done
# echo doing stuff...