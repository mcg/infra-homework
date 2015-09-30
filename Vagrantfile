# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

NUM_OF_NODES = 1


(1..NUM_OF_NODES).each do |i| 
  name = "homework-#{i}"
  ip = "192.168.11.#{i+10}"

  config.vm.define vm_name = name do |node| 
    if i == 1
      node.vm.network "forwarded_port", guest: 80, host: 8080
      node.vm.network "forwarded_port", guest: 9000, host: 9000
    end
    node.vm.network "private_network", ip: ip
    node.vm.hostname = name
    end
  end
  config.vm.box = "ubuntu/trusty64"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "./playbook.yml"
  end
end
