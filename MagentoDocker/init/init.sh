#!/usr/bin/env bash
service ssh restart
service mysql restart
service php7.2-fpm restart > /dev/null ||\
service php7.1-fpm restart > /dev/null
chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
service mysql restart
service rabbitmq-server restart
service cron restart
redis-server &>/dev/null & disown
Xvfb :11 -ac &>/etc/magento/logs/mtf_xvfb.log & disown
export DISPLAY=:11 && java -jar /etc/magento/resources/mtf/selenium2.53.1.jar &>/etc/magento/logs/mtf_selenium.log & disown
Xvfb :10 -ac &>/etc/magento/logs/mftf_xvfb.log & disown
export DISPLAY=:10 && java -jar /etc/magento/resources/mftf/selenium3.14.0.jar -port 44444 &>/etc/magento/logs/mftf_selenium.log & disown
varnishid = $(ps aux | egrep -io "varnish\s+([0-9]+)" | egrep -o "[0-9]+")
vcacheid = $(ps aux | egrep -io "vcache\s+([0-9]+)" | egrep -o "[0-9]+")
kill -9 $varnishid $vcacheid
echo "Initialized"
