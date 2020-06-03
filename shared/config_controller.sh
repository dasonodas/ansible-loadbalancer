#! /bin/bash
apt update -y
apt upgrade -y
apt-repository -y ppa:ansible/ansible
apt update
apt install ansible -y
apt autoclean -y
apt autoremove -y
cp /home/vagrant/shared/id_rsa /home/vagrant/.ssh/id_rsa
cp /home/vagrant/shared/id_rsa.pub /home/vagrant/.ssh/id_rsa.pub
mkdir /root/.ssh
cat /home/vagrant/shared/id_rsa.pub > /root/.ssh/authorized_keys