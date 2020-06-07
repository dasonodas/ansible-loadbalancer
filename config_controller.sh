#! /bin/bash
apt update -y
apt upgrade -y
apt-repository -y ppa:ansible/ansible
apt update
apt install ansible -y
apt autoclean -y
apt autoremove -y
mkdir /root/.ssh
cp /home/vagrant/shared/id_rsa /root/.ssh/id_rsa
cp /home/vagrant/shared/id_rsa.pub /root/.ssh/id_rsa.pub
chmod 600 /root/.ssh/id_rsa
chmod 644 /root/.ssh/id_rsa.pub
cat /home/vagrant/shared/id_rsa.pub > /root/.ssh/authorized_keys
ssh-keyscan 172.28.128.13 >> /root/.ssh/known_hosts
ssh-keyscan 172.28.128.14 >> /root/.ssh/known_hosts
ssh-keyscan 172.28.128.15 >> /root/.ssh/known_hosts
ssh-keyscan 172.28.128.16 >> /root/.ssh/known_hosts
ssh-keyscan 172.28.128.17 >> /root/.ssh/known_hosts
cd /home/vagrant/shared/playbooks
ansible-playbook -i dbservers dbservers.yml && ansible-playbook -i loadbalancers loadbalancers.yml && ansible-playbook -i webservers webservers.yml && ansible-playbook -i controllers controller.yml
