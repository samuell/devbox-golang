# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

	config.vm.provider "virtualbox" do |vbox|
		vbox.memory = 2048
		vbox.cpus = 2
	end
	config.vm.box = "ubuntu/trusty64"
	config.vm.network "forwarded_port", guest: 80, host: 8080
	config.vm.provision :ansible do |ansible|
		ansible.playbook = "playbook.yml"
	end

end
