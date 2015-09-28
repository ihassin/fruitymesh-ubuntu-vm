# FruityMesh dev VM provisioning with Vagrant using VirtualBox and/or Parallels

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

# Pre-requisites

* Please install VirtualBox from [here](https://www.virtualbox.org/wiki/Downloads).
* Please install Vagrant from [here](https://docs.vagrantup.com/v2/installation).
* Please install Ansible from [here](http://docs.ansible.com/ansible/intro_installation.html#getting-ansible).

* If you are using Parallels, download it from [here](http://trial.parallels.com/?lang=en&terr=en)

# Provisioning the VM

*VirtualBox* and *Parallels* are supported.

To use VirtualBox:

```
cp Vagrantfile.vb Vagrantfile
cp inventory.ini.vb inventory.ini
```
Vagrantfile assumes a base box named 'ubuntu/trusty64'.


To use Parallels:

```
cp Vagrantfile.pvm Vagrantfile
cp inventory.ini.pvm inventory.ini
```

Vagrantfile assumes a base box named 'parallels/ubuntu-14.04'.

If you want to change the VM's IP address, or networking in general, please edit Vagrantfile to suite your needs.

## Changing the ip address

The inventory file is set to load a DNS entry named 'fruity-vb' (for VirtualBox) and/or 'fruity-p' (For Parallels) . Make sure you /etc/hosts contains an entry for it. As an example:

```
33.33.33.55	fruity-vb		# VirtualBox version
```

(Parallels will give you its box's IP as it's loading)

The IP must match the entry in the Virtualox Vagrantfile:

```
fruity.vm.network "private_network", ip: "33.33.33.55" # VirtualBox version
```

## Providing your own SSH public key to access the VM

You can place your public key in infra/roles/common/templates/ita.pub. The keys there will be added to the 'deploy' user that the script creates.
Placing your public key there will allow you to connect using ssh without the need to log in manually.

## Bringing up the VM

You can then bring up the box for configuring by issuing the following command:

```
cd infra
vagrant up --provider virtualbox
# or
vagrant up --provider parallels
```

It will take about 20 minutes when it installs for the first time.

Once you have done that, you can ```ssh deploy@fruity``` with the password found in common/vars/main.yml
If you want to access the VM using your own ssh key, insert your public key in common/templates/ssh_keys.pub

# Fruity Time!

Once the Ansible script finishes running, log on to the VM as the deploy user

```
ssh deploy@fruity-vb # or deploy@fruity-p
```
and attempt to build the [FruityMesh image](https://github.com/mwaylabs/fruitymesh) for the NRF51 by issuing:

```
cd nrf/projects/fruitymesh
make clean
make
```

And the flash the device with the resulting image built in _build/FruityMesh.hex using JLink.
JLink can be found in ~/nrf/tools.

## Flashing using VirtualBox
It's hard to get proper USB support for VirtualBox images, so a quick and dirty way is to copy the resulting hex file to the shared directory on your host machine.
Do this by copying to /vagrant

# Some testing

## ServerSpec

Some ServerSpec tests accompany this VM, just for fun.
Execute them using:

```
rake
```

## Cucumber

Run cucumber and see this run:

```
Feature: As a ninja developer
  I want to have a FruityMesh development environment ready
  So that I can write the next mesh killer-app

  Scenario Outline: Having a VirtualBox Ubuntu VM to develop FruityMesh apps
    Given I use <provider> to create a vm at <host>
    When log on as "deploy"
    Then I can build the "fruitymesh" image
    And I see the result

    Examples:
    | provider      | host          |
    | "VirtualBox"  | "fruity-vb"   |
    | "Parallels"   | "fruity-pvm"  |
```

# Contributing

1. Fork it (https://github.com/ihassin/fruity-ubuntu-vm/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

# License

MIT
