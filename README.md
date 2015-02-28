# Golang-Vagrant-Ansible

A Vagrant box with Ansible provisioning for setting up a Vim-based Golang development environment.

![Screenshot](golang-vagrant-ansible.png)

## Prerequisites

- [Vagrant](https://www.vagrantup.com/)
- [Ansible](http://www.ansible.com/)
- [VirtualBox](https://www.virtualbox.org/)

### Installing the requirements in Ubuntu (tested with 14.04)

1. Install Virtualbox:
	```bash
	sudo apt-get install virtualbox
	```

2. Install a recent version of ansible:
   ```bash
   sudo apt-get install ansible/trusty-backports
   ```

   *(if you ubuntu version is "trusty", otherwise, replace it with your appropriate version)*
3. Install Vagrant, by first downloadng the proper .deb file from [vagrantup.com](https://www.vagrantup.com/downloads.html)

4. ... and then installing it with:
	```bash
	sudo dpkg -i <deb-file>
	```

## Setup and Usage

#### Clone the github repository:

```bash
git clone git@github.com:samuell/golang-vagrant-ansible
cd golang-vagrant-ansible
```

#### Bring up the VM

```bash
vagrant up
```

#### Log in to the VM

```bash
vagrant ssh
```

#### Create a repository for uploading to github:

```bash
mkcd ~/code/go/src/github/<user>/<repo>
git init .
```

#### Now, start coding!

```bash
vim main.go
```
- Autocompletion will happen automatically
- If you have turned off the YouCompleteMe role, you will get autocompletion with `<C-x><C-o>`

### References

- [Vagrant & Ansible Quickstart Tutorial](http://adamcod.es/2014/09/23/vagrant-ansible-quickstart-tutorial.html)
- [Vagrant Virtual Machine Cluster](http://jessesnet.com/development-notes/2014/vagrant-virtual-machine-cluster)
