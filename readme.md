Simple load balanced site with Ansible and Docker
=================================================
This repo will build an example site that consists of one haproxy, with two nginx hosts load balanced behind it.

Getting Started
===============
You have a Unix like system and the following prerequisites.
- Ansible >= 1.9.1
- Vagrant >= 1.7.4
- Ports 8080 and 9000 available.
- Clone this repo, `git clone https://github.com/mcg/infra-homework.git`

1. `cd infra-homework`
2. Edit the included weave_secret.txt file(or leave it as is for this example). This will be the key used to setup the Weave encrypted network.
3. You should now be able to `vagrant up`
4. Assuming the provision went OK, from your host machine, you should be able to visit...
   - http://localhost:8080 (haproxy LB container, balances two nginx containers)
   - http://localhost:9000/haproxystats (view haproxy stats)

What happened?
==============
1 Vagrant launches a single instance of Ubuntu Trusty
2 Vagrant then runs an Ansible provisioner to setup the instance
  - Makes sure ssh and docker are running
  - Starts Weave
  - Starts an Ansible provision inside the instance to build docker images and run containers for our example infra.

Weave
==============
Our container instances are launched with the Weave provided docker_uri env. Weave will assign each containter
a private IP and a DNS name of "NAME.weave.local". Inter-container communication should be encrypted.

Some things to try
------------------
- Connect to the Vagrant instance, `vagrant ssh`
- Expose a Weave endpoing `sudo weave expose`
- View Weave DNS entries `sudo weave status dns`
- Access the haproxy endpoint `curl http://{{lb01 ip from previous command}}`
- Access a nginx endpoint directly `curl http://{{web01/02 ip from previous command}}:8081`

Troubleshooting
===============
- Rerun full provision, `vagrant provision`
- ssh into the Vagrant instance, `vagrant ssh`
- Rerun just the docker provisioning steps. From the Vagrant instance...
  - `cd /vagrant/provision`
  - `ansible-playbook -i inventory.yml site.yml`

