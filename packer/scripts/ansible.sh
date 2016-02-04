#!/bin/bash

# Install required packages
apt-get -y install git python-pip python-dev build-essential
pip install paramiko PyYAML Jinja2 httplib2 six

# Install Ansible from source
mkdir /home/user/workspace
cd /home/user/workspace
git clone git://github.com/ansible/ansible.git --recursive
cd ./ansible
source ./hacking/env-setup
