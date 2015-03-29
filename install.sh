#!/bin/bash

## 1. update ubuntu packages
sudo aptitude update
sudo aptitude safe-upgrade

## 2. install chef

chef_bin="/usr/bin/chef-solo"

if [ ! -f "$chef_bin" ] ;then
   sudo curl -L https://www.opscode.com/chef/install.sh | sudo bash
fi

## 3. Execute server configurations recipes
sudo "$chef_bin" -c solo.rb -j node.json
