# docker-core-setup


The main purpose of this repo is to create a Vagrant vm with Docker inside to connect your local terminal with. The main target audience is MacOS as you can install docker-ce in Linux via distro manager. You will need to install the Docker CLI, Docker Compose, Vagrant, and Vagrant's vb guest.

The hypervisor used for Vagrant will be Virtualbox so you will need ot install Virtual box and the extention pack for Virtualbox.

## Prerequisites

For MacOS:

```
brew install --cask virtualbox
brew install --cask virtualbox-extension-pack

brew install vagrant
vagrant plugin install vagrant-vbguest

brew install docker
brew install docker-compose
```

In the Vagrant file, there is a private ip address('###.###.#.#') to any address based on the range: 192.168.56.0/21. The pre-runs cript you need to run will ask for an ip address and change it for you. Make sure the format is correct as you enter the new ip address.


## Pre-run script

Inside this script is a couple settings needed to connect to the Vagrant vm via Docker CLI. I have commented out the aliases that I use to make it wasier to control the Vgrant vm state in any directory I'm in. 

You are encourgaed to modify the aliases however you wish. I also welcome any merges that adds to the aliases to make them more useful. 

## How to use this Vagrant setup

To start the box, you will need to be in this directory and run vagrant up. To pause the vm, use vagrant suspend. To stop the vm, use vagrant halt. You can look at the aliases kept commented out in the pre-run script to see how you can do these commands at any folder location and add them to your corresponding rc file. 
