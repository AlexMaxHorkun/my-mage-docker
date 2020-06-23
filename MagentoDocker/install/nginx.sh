#!/usr/bin/env bash
bin/echo -e "\n\n\e[1;32m=====================================================================================\e[0m\n\n"
bin/echo -e "\e[1;32mInstalling Nginx\e[0m"
bin/echo -e "\n\n\e[1;32m=====================================================================================\e[0m\n\n"
apt install -yqf nginx
service nginx stop
cp /etc/magento/system/resources/magento2.conf /etc/nginx/sites-available/magento2.conf
ln -s /etc/nginx/sites-available/magento2.conf /etc/nginx/sites-enabled/magento2.conf
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=US/ST=Texas/L=Austin/O=Me/CN=mage.ua"
cp /etc/magento/system/resources/magento2SSL.conf /etc/nginx/sites-available/magento2ssl.conf
ln -s /etc/nginx/sites-available/magento2ssl.conf /etc/nginx/sites-enabled/magento2ssl.conf
rm /etc/nginx/sites-enabled/default
bin/echo -e "\n\n\e[1;32m=====================================================================================\e[0m\n\n"
bin/echo -e "\e[1;32mInstalled Nginx\e[0m"
bin/echo -e "\n\n\e[1;32m=====================================================================================\e[0m\n\n"