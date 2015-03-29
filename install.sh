#!/bin/bash

## 1. update ubuntu packages
sudo aptitude update
sudo aptitude safe-upgrade

## 2. install chef

chef_bin=/usr/bin/chef-solo

if ! test -f "$chef_bin"; then
   sudo curl -L https://www.opscode.com/chef/install.sh | sudo bash &&
fi

## 4. Clone configure_server repository
cd /tmp
git clone https://github.com/aslammncs/configure-server.git

## 5. Execute server configurations recipes
cd /tmp/configure-server
sudo "$chef_bin" -c solo.rb -j node.json
