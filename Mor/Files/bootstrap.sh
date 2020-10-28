#!/usr/bin/env bash
yum update -y
if [[ $? -eq 1 ]]; then
        yum install -y yum-utils
        yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
        yum install -y docker-ce docker-ce-cli containerd.io
        systemctl enable docker
        systemctl start docker
else
        echo "docker installed"
fi

which wget
if [[ $? -eq 1 ]]; then
        yum install -y wget
else
        echo "wget installed"
fi
if  service --status-all | grep -Fq 'jenkins' ; then
        echo "Jenkins installed"
else
        wget -O /etc/yum.repos.d/jenkins.repo \
            https://pkg.jenkins.io/redhat-stable/jenkins.repo
        rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
        yum upgrade -y
        yum install jenkins java-1.8.0-openjdk-devel -y
        sudo systemctl start jenkins
	sudo systemctl enable jenkins
fi
echo "Done!"
