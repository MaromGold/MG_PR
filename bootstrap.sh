#!/bin/bash
#This bootstrap script installs Docker and Jenkins

# The docker part could also be accomplished using: sudo apt install docker && sudo systemctl start docker && sudo systemctl enable docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

cd $HOME
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum install jenkins
sudo systemctl start jenkins.service
sudo systemctl enable jenkins.service

tar -zxf git.tar.gz
cd  "$(\ls -1dt ./*/ | head -n 1)"
make configure
./configure --prefix=/usr/local
sudo make install

