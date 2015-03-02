# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # --------------------------------------------------------------------
  # Definitions for the VirtualBox machine
  # --------------------------------------------------------------------
  config.vm.define "virtualbox", autostart: false do |vbox|
    vbox.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 2
    end
    vbox.vm.box = "ubuntu/trusty64"
    vbox.vm.network "forwarded_port", guest: 80, host: 8080
    vbox.vm.provision :ansible do |ansible|
      ansible.playbook = "playbook.yml"
    end
  end

  # --------------------------------------------------------------------
  # Definitions for the Docker container
  # --------------------------------------------------------------------
  config.vm.define "docker", autostart: false do |dkr|
    system("bash genkeys.sh")
    dkr.vm.provider "docker" do |d|
      d.has_ssh = true
      d.build_dir = "."
    end

    dkr.ssh.private_key_path = "keys/vagrantssh.key"
    dkr.ssh.username = "vagrant"

    config.vm.provision :ansible do |ansible|
      ansible.playbook = "playbook.yml"
      ansible.extra_vars = { ansible_ssh_user: 'root' }
      #ansible.verbose = "vvvv"
    end
    dkr.vm.synced_folder ".", "/vagrant"
  end
end
