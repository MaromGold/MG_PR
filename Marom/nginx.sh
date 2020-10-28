#!/bin/bash

if which nginx > /dev/null 2>&1

then
    echo "nginx is installed"
    echo "Would you like nginx to be removed from this system? (yes/no)"
    read $choice
    if "$choice" = "yes"; then sudo systemctl stop nginx.service && sudo systemctl disable nginx.service && sudo userdel -r nginx && sudo rm -rf /etc/nginx && sudo rm -rf /var/log/nginx && sudo rm -rf /var/cache/nginx/ && sudo rm -rf /usr/lib/systemd/system/nginx.service && sudo yum remove -y nginx
	fi
    if "$choice" = "no"; then echo "OK. nginx will remain intact".
	fi

else
    echo "nginx does not exist on this machine"
    echo "Installing nginx now..."
    sudo yum install -y nginx
    sudo systemctl start nginx
    sudo systemctl enable nginx
fi
