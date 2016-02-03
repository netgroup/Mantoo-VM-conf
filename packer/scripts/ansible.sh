#!/bin/bash

# Install Ansible from source
cd /home/user/workspace
git clone git://github.com/ansible/ansible.git --recursive
cd ./ansible
source ./hacking/env-setup