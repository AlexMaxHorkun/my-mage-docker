#!/usr/bin/env bash
chown -R www-data:www-data /var/www/magento2
cp /etc/magento/system/resources/crontab /etc/crontab
bin/echo -e "\n\n\e[1;34m=====================================================================================\e[0m\n\n"
bin/echo -e "\e[1;34mINSTALLATION FINISHED\e[0m"
bin/echo -e "\n\n\e[1;34m=====================================================================================\e[0m\n\n"