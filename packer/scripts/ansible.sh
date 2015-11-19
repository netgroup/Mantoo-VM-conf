#!/bin/bash

apt-get -y install software-properties-common
add-apt-repository ppa:ansible/ansible
apt-get update
apt-get -y install ansible
