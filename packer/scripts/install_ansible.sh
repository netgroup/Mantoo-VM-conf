#!/bin/bash

# Enable script output
set -x

# Install required packages
apt-get update
apt-get -y install software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get -y install ansible
