#!/bin/bash
<<<<<<< HEAD
#This script checks wether nginx is installed, if not prompts to install. 
=======
#This script checks wether nginx is installed, if not prompts to install.
>>>>>>> 31d9676d247680e85c30e2f1736a88d81738855b

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
<<<<<<< HEAD
    sudo systemctl enable nginx
    sudo systemctl start nginx
fi

=======
    sudo systemctl start nginx
    sudo systemctl start nginx
fi
>>>>>>> 31d9676d247680e85c30e2f1736a88d81738855b
