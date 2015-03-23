#!/bin/bash

chef_bin=/usr/bin/chef-solo

#if ! test -f "$chef_bin"; then
#   sudo curl -L https://www.opscode.com/chef/install.sh | sudo bash &&
#fi

sudo "$chef_bin" -c solo.rb -j node.json
