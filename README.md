NGINX Consul Vagrant - Lab
==========================

This is a Vagrant setup that will download, install, and configure the lab, allowing you to learn, and play with dynamic upstreams in NGINX that are resolved dynamically from Consul via ngx-lua.

#### Requirements

- Vagrant 1.7.4+
- Probably OSX (untested on other platforms)
- Probably VMWare (untested on Virtualbox)

#### Instructions

*Setup*
```
sudo gem install berkshelf
vagrant plugin install vagrant-omnibus
vagrant plugin install vagrant-berkshelf
git clone https://github.com/sigil66/nginx-consul-vagrant.git
cd nginx-consul-vagrant
vagrant up
```

*Usage*
After vagrant up:
- visit http://nginx-consul-lab.local
- visit http://nginx-consul-lab.local:8500
- review /etc/nginx/sites-available/default
- review /etc/nginx/lua/consul/balancer.rb
- to get the example services going:
  - `vagrant ssh`
  - `vertx start /vagrant/vertx-scripts/foo_service.rb`
  - `vertx stop /vagrant/vertx-scripts/foo_service.rb`
  - wait 20ish seconds and check the endpoints in your browser:
    - http://nginx-consul-lab.local/somefoo
    - http://nginx-consul-lab.local/somebar
  - `vertx list`
  - `vertx stop <serviceid>`
  - observe service deregistration

*Automation*
This setup ties together the following projects:
- https://github.com/sigil66/openresty-xenial-package
- https://github.com/sigil66/oracle-java
- https://github.com/sigil66/apt.sigil66.com
- https://github.com/sigil66/vertx-package
- https://github.com/sigil66/sigil66-cookbook
- https://github.com/sigil66/nginx-consul-cookbook

*Issues*
- There appears to be some strange interaction with the berks command and vagrant-berkshelf that mangles the GEM_PATH for some ruby setups (investigating)
