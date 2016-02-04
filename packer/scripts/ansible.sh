#!/bin/bash -x

# Install required packages
apt-get -y install git python-pip python-dev build-essential
pip install paramiko PyYAML Jinja2 httplib2 six

# Install Ansible from source
cd /opt
git clone git://github.com/ansible/ansible.git --recursive
cd ./ansible
source ./hacking/env-setup

# Put Ansible in PATH
echo "export PATH=/opt/ansible/bin:$PATH" >> /etc/profile.d/ansible.sh
chmod +x /etc/profile.d/ansible.sh
