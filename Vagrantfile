# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  #carpeta compartida
  config.vm.synced_folder "shared", "/home/vagrant/shared", owner: "vagrant", group: "vagrant", create: true
  config.vm.synced_folder "wordpress", "/var/www/html/wordpress", owner: "www-data", group: "www-data", create: false

  # balanceador de carga
    config.vm.define "load-balancer" do |app|
      app.vm.box = "bento/ubuntu-18.04"
      app.vm.network "private_network", ip: "172.28.128.13"
      app.vm.hostname = "load-balancer"
      app.vm.provision "shell", path: "config_nodes.sh"
      config.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.cpus = 2
      end
    end

  # Servidor Web 1
    config.vm.define "webserver-one" do |app|
      app.vm.box = "bento/ubuntu-18.04"
      app.vm.network "private_network", ip: "172.28.128.14"
      app.vm.hostname = "webserver-one"
      app.vm.provision "shell", path: "config_nodes.sh"
      config.vm.provider "virtualbox" do |v |
        v.memory = 1024
        v.cpus = 2
      end
    end

# Servidor Web 2
    config.vm.define "webserver-two" do |app|
      app.vm.box = "bento/ubuntu-18.04"
      app.vm.network "private_network", ip: "172.28.128.15"
      app.vm.hostname = "webserver-two"
      app.vm.provision "shell", path: "config_nodes.sh"
      config.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.cpus = 2
      end
    end

# Base de datos
    config.vm.define "dbserver" do |app|
      app.vm.box = "bento/ubuntu-18.04"
      app.vm.network "private_network", ip: "172.28.128.16"
      app.vm.hostname = "dbserver"
      app.vm.provision "shell", path: "config_nodes.sh"
      config.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.cpus = 2
      end
    end
# controlador
    config.vm.define "controller" do |app|
      app.vm.box = "bento/ubuntu-18.04"
      app.vm.network "private_network", ip: "172.28.128.17"
      app.vm.hostname = "controller"
      app.vm.provision "shell", path: "config_controller.sh"
      config.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.cpus = 2
      end 
    end

 
end
