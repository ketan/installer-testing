# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  boxes = {
    'ubuntu-12.04' => {virtualbox: 'ubuntu/precise64',   docker: 'ubuntu/precise'},
    'ubuntu-14.04' => {virtualbox: 'ubuntu/trusty64',    docker: 'ubuntu/trusty'},
    'centos-6'     => {virtualbox: 'boxcutter/centos67', docker: 'centos/centos6'},
    'centos-7'     => {virtualbox: 'boxcutter/centos7',  docker: 'centos/centos7'},
  }

  boxes.each do |name, box_cfg|
    config.vm.define name do |vm_config|
      vm_config.vm.network "private_network", type: "dhcp"

      vm_config.vm.provider :virtualbox do |vb, override|
        override.vm.box = box_cfg[:virtualbox]
        vb.gui    = ENV['GUI'] || false
        vb.memory = (ENV['MEMORY'] || 1).to_i * 1024
        vb.cpus   = 1
      end
    end
  end

  if Vagrant.has_plugin?('vagrant-proxyconf')
    config.proxy.http     = 'http://10.0.2.2:3128/'
    config.proxy.https    = 'http://10.0.2.2:3128/'
    config.proxy.no_proxy = 'localhost,127.0.0.1,172.16.18.1,172.16.38.21'
  end

  if Vagrant.has_plugin?('vagrant-ohai')
    config.ohai.primary_nic = "eth1"
  end

  if Vagrant.has_plugin?('vagrant-cachier')
    config.cache.scope = :box
    config.cache.enable :apt
    config.cache.enable :apt_lists
    config.cache.enable :yum
  end
end
