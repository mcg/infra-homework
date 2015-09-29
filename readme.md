Simple load balanced site with Ansible and Docker
=================================================
This repo will build a demo site that consists of haproxy with two nginx hosts behind it.

Getting Started
===============
You have a Unix like system and the following prerequisites.
- Ansible >= 1.9.1
- Vagrant >= 1.7.4
- Ports 8080 and 9000 available.
- Clone this repo, `git clone https://github.com/mcg/infra-homework.git`

1. `cd infra-homework`
2. Edit the included weave_secret.txt file. This will be the key used to setup the Weave encrypted network.
3. You should now be able to `vagrant up`
4. Assuming the provision went OK, you should be able to visit http://localhost:8080 and http://localhost:9000/haproxystats

What happened?
==============
1 Vagrant provisions a single instance of Ubuntu Trusty
2 Vagrant then runs an Ansible provisioner to setup the instance
  - Makes sure ssh and docker are running
  - Starts Weave
  - Starts an Ansible provision inside the instance to build docker images and run containers for our example infra.

Troubleshooting
===============
- Rerun full provision, `vagrant provision`
- ssh into the Vagrant instance, `vagrant ssh`
- Rerun just the docker provisioning steps. From the Vagrant instance...
  - `cd /vagrant/provision`
  - `ansible-playbook -i inventory.yml site.yml`

