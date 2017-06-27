# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "osd1" do |osd1|
    osd1.vm.box = "centos/7"
    osd1.vm.network "private_network", ip: "192.168.22.10"
    osd1.vm.provision "shell", path: "provision/common.sh"
    osd1.vm.hostname = "osd1"
  end
  config.vm.define "osd2" do |osd2|
    osd2.vm.box = "centos/7"
    osd2.vm.network "private_network", ip: "192.168.22.11"
    osd2.vm.provision "shell", path: "provision/common.sh"
    osd2.vm.hostname = "osd2"
  end
  config.vm.define "osd3" do |osd3|
    osd3.vm.box = "centos/7"
    osd3.vm.network "private_network", ip: "192.168.22.12"
    osd3.vm.provision "shell", path: "provision/common.sh"
    osd3.vm.hostname = "osd3"
  end
  config.vm.define "mon1" do |mon1|
    mon1.vm.box = "centos/7"
    mon1.vm.network "private_network", ip: "192.168.22.20"
    mon1.vm.provision "shell", path: "provision/common.sh"
    mon1.vm.hostname = "mon1"
  end
  config.vm.define "mds1", autostart: false do |mds1|
    mds1.vm.box = "centos/7"
    mds1.vm.network "private_network", ip: "192.168.22.30"
    mds1.vm.provision "shell", path: "provision/common.sh"
    mds1.vm.hostname = "mds1"
  end
  config.vm.define "deploy" do |deploy|
    deploy.vm.box = "centos/7"
    deploy.vm.network "private_network", ip: "192.168.22.9"
    deploy.vm.provision "shell", path: "provision/common.sh"
    deploy.vm.provision "shell", path: "provision/deploy.sh"
    deploy.vm.hostname = "deploy"
  end
end

