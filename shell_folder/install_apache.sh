#!/bin/bash
sudo apt-get update
sudo apt-get install -y apache2 libapache2-mod-log-sql-mysql
sudo a2enmod unique_id
sudo systemctl start apache2
sudo systemctl enable apache2
sudo mv /tmp/000-default.conf /etc/apache2/sites-available/000-default.conf
sudo /etc/init.d/apache2 restart
