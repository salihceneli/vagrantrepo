#!/bin/bash

# update CentOS with any patches
yum update -y --exclude=kernel

# Tools
yum install -y nano git unzip screen

# Apache
yum install -y httpd httpd-devel httpd-tools
systemctl start httpd
systemctl enable httpd
systemctl stop httpd

rm -rf /var/www/html
ln -s /vagrant /var/www/html

systemctl start httpd

# PHP
yum install -y php php-cli php-common php-devel php-mysql

# MySQL
yum install -y mariadb mariadb-server mariadb-devel
systemctl start mariadb 
systemctl enable mariadb.service

mysql -u root -e "SHOW DATABASES";

# Download Starter Content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/salihceneli/vagrantrepo/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/salihceneli/vagrantrepo/master/files/info.php

systemctl restart httpd.service

