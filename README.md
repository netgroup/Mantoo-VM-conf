# Mantoo-VM-conf
Setup a Mantoo VM from scratch, installing all packages and tools
The VM is first built with [Packer](https://www.packer.io/) and then provisioned
with shell scripts and via [Ansible](http://www.ansible.com/).

The whole building process should take about:
* 10 minutes for OS installation
* 5 minutes to install Ansible

## Requirements
The only requirements are a working installation of:
1. [Packer](https://www.packer.io/). This project has been tested with Packer 0.8.6;
2. [VirtualBox](https://www.virtualbox.org/)

## Project structure
This project has the following components:
1. Packer templates and configuration files (in the `packer` directory)
2. Ansible playbooks, roles and vars (in the `ansible` directory)
3. A [Vagrantfile](https://www.vagrantup.com/) (in the `vagrant` directory)

## Building the VM
After you have installed Packer, just run: `packer build packer/OSHI-VM.json`

## Provisioning the VM
The current Packer template (`packer/OSHI-VM.json`) is configured to execute the following provisioning steps:
1. Install Ansible (via a shell script)
2. Copy the contents of the `ansible` directory to `/home/user/ansible` on the VM

To run Ansible playbooks just start the VM and run the playbook that has been copied during the provisioning phase. From `/home/user/ansible` directory on the VM run:
`ansible-playbook -i inventory OSHI-VM.yml`

### A note about automatic provisioning
Packer can be configured to automatically run Ansible as provisioner. This feature will be enabled when our playbooks will be more stable.

### Developing Ansible roles
While developing Ansible roles, it's useful to run the whole playbook as described above, instead of letting Packer automatically run it. This avoids to repeat the whole building process and let developers focus on the provisioning phase.

## Output
Packer will produce two artifacts in the `output` directory:
1. A VirtualBox VM (in the `output-virtualbox` directory)
2. A Vagrant box (in the `output-vagrant` directory)

## Accessing the VM
Run one of the output artifacts above and use SSH as `user` (password: `user`) to login to the VM.

### Virtualbox NAT configuration
If you want to access the Virtualbox VM you may have to configure the NAT accordingly, i.e. to map the SSH port.
