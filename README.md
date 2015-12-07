# Mantoo-VM-conf
Setup a Mantoo VM from scratch, installing all packages and tools
The VM is first built with [Packer](https://www.packer.io/) and then provisioned
with shell scripts and via [Ansible](http://www.ansible.com/).

The whole building process should take about:
18:05 - 18:17 Packer

## Requirements
The only requirements are a working installation of:
1. [Packer](https://www.packer.io/). This project has been tested with Packer 0.8.6;
2. [VirtualBox](https://www.virtualbox.org/)

## Project structure
This project has the following components:
1. Packer templates and configuration files (in packer directory)
2. Ansible playbooks, roles and vars (in ansible directory)

## Building the VM
After you have installed Packer, just run: `packer build packer/OSHI-VM.json`

## Provisioning the VM
The current Packer template (`packer/OSHI-VM.json`) is configured to execute the following provisioning steps:
1. Install Ansible (via a shell script)
2. Copy the contents of `ansible` directory to `/home/user/ansible` on the VM

To run Ansible playbooks just start the VM and run the playbook that has been copied during the provisioning phase. From `/home/user/ansible` directory on the VM run:
`ansible-playbook -i inventory OSHI-VM.yml`

### A note about automatic provisioning
Packer can be configured to automatically run Ansible as provisioner. This feature will be enabled when our playbooks will be more stable.

### Developing Ansible roles
While developing Ansible roles, it's useful to run the whole playbook as described above, instead of letting Packer automatically run it. This avoids to repeat the whole building process and let developers focus on the provisioning phase.

## Output
Packer will produce two artifacts:
1. A VirtualBox VM (in the `output-virtualbox` directory)
2. A [Vagrant](https://www.vagrantup.com/) box (in the `output-vagrant` directory)
