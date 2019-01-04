# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
    # JenkinsCI
    config.vm.define "jenkinsci" do |jenkinsci|
      jenkinsci.vm.box = "ubuntu/xenial64"
      jenkinsci.vm.network "private_network", ip: "172.28.128.40"
      #config.vm.synced_folder "./", "/vagrant_data"
      jenkinsci.vm.hostname = "jenkinsci"
      config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "2048"]
        vb.customize ["modifyvm", :id, "--cpus", "2"]
        vb.name = "jenkinsci"
      end
      jenkinsci.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update -y
      SHELL
    end
    # Bitbucket SCM
    config.vm.define "bitbucket" do |bitbucket|
      bitbucket.vm.box = "ubuntu/xenial64"
      bitbucket.vm.network "private_network", ip: "172.28.128.41"
      #config.vm.synced_folder "./", "/vagrant_data"
      bitbucket.vm.hostname = "bitbucket"
      config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "2048"]
        vb.customize ["modifyvm", :id, "--cpus", "2"]
        vb.name = "bitbucket"
      end
      bitbucket.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update -y
      SHELL
    end
end
