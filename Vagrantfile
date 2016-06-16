# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "cbednarski/ubuntu-1604"
  config.vm.hostname = "nginx-consul-lab"
  
  if Vagrant.has_plugin?("vagrant-omnibus")
    config.omnibus.chef_version = 'latest'
  end

  config.berkshelf.enabled = true
  config.vm.provision :chef_solo do |chef|
    chef.channel = 'stable'
    chef.run_list = [
      'recipe[nginx-consul::default]'
    ]
  end
end
