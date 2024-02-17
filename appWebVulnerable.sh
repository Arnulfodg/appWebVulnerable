#! /bin/bash

#sudo apt install figlet -y

figlet MIDESMIS

figlet mutillidae

sudo apt update -y

sudo apt upgrade -y

sudo apt install apache2 -y

sudo a2enmod rewrite

sudo service apache2 restart

sudo apt install php libapache2-mod-php -y

sudo apt install mysql-server php-mysql -y

sudo service mysql restart

sudo service apache2 restart

echo "Al ingresar a la abse de datos coloca lo siguiente/n"
echo "/nALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'mutillidae';/n"

cd /var/www/html

sudo apt install php-curl php-mbstring php-xml -y

sudo apt install git -y

sudo git clone http://github.com/webpwnized/mutillidae.git

firefox localhost/mutillidae
