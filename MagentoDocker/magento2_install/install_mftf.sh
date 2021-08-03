#!/usr/bin/env bash
cd /var/www/magento2/dev/tests/acceptance
cp /etc/magento/resources/mftf/.env /var/www/magento2/dev/tests/acceptance/
cp /etc/magento/resources/mftf/codeception.dist.yml /var/www/magento2/dev/tests/acceptance/
cp /etc/magento/resources/mftf/functional.suite.yml /var/www/magento2/dev/tests/acceptance/tests/
chown -R www-data ../acceptance &&\
cp .htaccess.sample .htaccess &&\
cd /var/www/magento2 &&\
sudo -u www-data php vendor/bin/mftf build:project
sudo apt-get install iputils-ping
sudo touch pingtemp.txt
sudo chmod 777 pingtemp.txt
ping magento-varnish -c 1 >> pingtemp.txt
temphostsval=$(cat pingtemp.txt | egrep "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+\)\:" -o | egrep "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+" -o)
echo "$temphostsval  mage.ua" | sudo tee /etc/hosts -a
