#! /bin/bash
apt update -y
apt upgrade -y
apt-repository -y ppa:ansible/ansible
apt update
apt install ansible -y
apt autoclean -y
apt autoremove -y
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
systemctl restart ssh
