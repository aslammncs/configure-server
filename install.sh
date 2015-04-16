#!/bin/bash

## 1. update ubuntu packages
sudo aptitude update
sudo aptitude safe-upgrade

## 2. install chef

chef_bin="/usr/bin/chef-solo"
aws_bin="/usr/local/bin/aws"
python_bin="/usr/bin/python"
pip_bin="/usr/bin/pip"

echo "Installing chef ... if not installed -"
echo ""
if [ ! -f "$chef_bin" ] ;then
   sudo curl -L https://www.opscode.com/chef/install.sh | sudo bash
fi

echo "Installing python ... if not installed -"
echo ""
if [ ! -f "$python_bin" ] ;then
   sudo apt-get install -y python2.7
fi

echo "Installing pip ... if not installed -"
echo ""
if [ ! -f "$pip_bin" ] ;then
   sudo apt-get install -y python-pip
fi

echo "Installing awscli ... if not installed -"
echo ""
if [ ! -f "$aws_bin" ] ;then
   sudo sudo pip install awscli 
fi

## 3. Execute server configurations recipes
echo "Executing the server configurations recipes ..."

sudo "$chef_bin" -c solo.rb -j node.json


