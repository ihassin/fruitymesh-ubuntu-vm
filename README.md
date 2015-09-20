# FruityMesh dev VM provisioning

The roles are

- common: basic ubuntu
- All that's needed to build FruityMesh on the NRF51 

# git

```
git clone git@github.com:ihassin/fruity-ubuntu-vm.git
```
or

```
git clone https://github.com/ihassin/fruity-ubuntu-vm.git
```

# Prerequisites

* Please install VirtualBox from [here](https://www.virtualbox.org/wiki/Downloads).
* Please install Vagrant from [here](https://docs.vagrantup.com/v2/installation).
* Please install Ansible from [here](http://docs.ansible.com/ansible/intro_installation.html#getting-ansible).

## Provisioning the VMs

Vagrantfile assumes a base box named 'ubuntu/trusty64'.

If you want to change the VM's IP address, or networking in general, please edit Vagrantfile to suite your needs.

Once you have done that, you can ```ssh deploy@33.33.33.45``` with the password found in common/vars/main.yml
If you want to access the VM using your own ssh key, insert your public key in common/templates/ssh_keys.pub

You can then bring up the box for configuring by issuing the following command:

```
cd infra
vagrant up|provision
```

It will take about 20 minutes when it installs for the first time.

# Fruity Time!

Once the Ansible script finishes, log on to the VM as the deploy user

```
ssh deploy@33.33.33.45
```
and attempt to build the image for the NRF51 by issuing:

```
cd nrf/projects/fruitymesh
make
```
Flash the device with the resulting image built in _build/FruityMesh.hex

# Contributing

1. Fork it (https://github.com/ihassin/fruity-ubuntu-vm/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

# License

MIT
