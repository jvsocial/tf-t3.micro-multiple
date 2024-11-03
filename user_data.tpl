#!/bin/bash
sudo apt-get update
sudo apt-get install -y ansible
sudo hostnamectl set-hostname ${host_name}
sudo echo "127.0.1.1 ${host_name}" >> /etc/hosts
sudo hostnamectl
sudo reboot 
ssh-keygen -t rsa -b 4096 -C "automation-keys"