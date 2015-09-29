Simple load balanced site with Ansible and Docker
=================================================
This repo will build a demo site that consists of haproxy with two nginx hosts behind it.

Getting Started
===============
Make sure you have a Unix like system and the following prerequisites.
- Ansible >= 1.9.1
- Vagrant >= 1.7.4
- Ports 8080 and 9000 available.

- Clone this repo.
```
git clone https://github.com/mcg/infra-homework.git 
```
- cd into infra-homework
- Edit the included weave_secret.txt file. This will be the key used to setup the Weave encrypted network.
- You should now be able to "vagrant up"
- Assuming the provision went OK, you should be able to visit http://localhost:8080 and http://localhost:9000/haproxystats

What happened?
==============
- Vagrant provisions a single instance of Ubuntu Trusty
- Vagrant then runs an Ansible provisioner to setup the instance
  - Make sure ssh and docker are running
  - Starts Weave
  - Starts an Ansible provision to build docker images and run containers for our example infra.

Troubleshooting
===============
- Rerun full provision, "vagrant provision"
- ssh into the Vagrant instance, "vagrant ssh"
- Rerun just the docker provisioning steps. From the Vagrant instance...
  - cd /vagrant/provision
  - ansible-playbook -i inventory.yml site.yml

