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
3. Provision the VM following `ansible/OSHI-VM.yml` playbook

### A note about manual provisioning
Packer is configured to automatically provision the VM with Ansible.

The playbooks, roles and vars files are available in `/home/user/ansible` if you want to repeat the provisioning process manually. This may be needed if you want to update packages or pull the latest code from GitHub, for example.

To manually run Ansible playbooks just start the VM and run the playbook that has been copied during the provisioning phase. From `/home/user/ansible` directory on the VM run:
`ansible-playbook -i inventory OSHI-VM.yml`

### Developing Ansible roles
While developing Ansible roles, it's useful to first build the artifacts without the new roles so we are sure the process is going to complete successfully.
Then you can start the development of new roles on the VM and run the whole play locally as described above.
This avoids to repeat the whole building process just to discover that you put an extra `,` in your, now unparsable, yaml.

## Output
Packer will produce two artifacts in the `output` directory:
1. A VirtualBox VM (in the `output-virtualbox` directory)
2. A Vagrant box (in the `output-vagrant` directory)

## Running the VM
Run one of the output artifacts above and use SSH as `user` (password: `user`) to login to the VM.

### Vagrant
The box is not currently hosted on [Atlas](https://atlas.hashicorp.com/boxes/search), so you have to manually install it in your local Vagrant repository by running `vagrant box add netgroup/oshi oshi.box` from the `output/output-vagrant` directory. After this installation, a simple `vagrant up` from the `vagrant` directory will start the VM.

### Virtualbox
#### Virtualbox NAT configuration
If you want to access the Virtualbox VM you may have to configure the NAT accordingly, for example to map the SSH port.
