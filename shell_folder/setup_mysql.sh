#!/bin/bash
sudo apt-get update
sudo apt-get -y install mysql-server
sudo ufw allow mysql
systemctl start mysql
systemctl enable mysql 
sudo mysql -u root << EOF 
  create database apachelogs;
  GRANT ALL PRIVILEGES ON *.* TO 'loguser'@'%' IDENTIFIED BY 'loguser_pw' WITH GRANT OPTION;
  flush privileges;
EOF
sudo mv /tmp/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
sudo /etc/init.d/mysql restart