#!/bin/bash -x

# Enable script output
set -x

# Reboot to refresh PATH changes
shutdown -r now

# See "Handling Reboots" section in https://www.packer.io/docs/provisioners/shell.html
sleep 60
