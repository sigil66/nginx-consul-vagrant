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
*Issues*

- There appears to be some screwy interaction with the berks command and vagrant-berkshelf with some ruby setups (investigating)

