#!/usr/bin/env bash
cd /var/www/magento2/dev/tests/acceptance &&\
composer install &&\
cp /etc/magento/resources/mftf/.env /var/www/magento2/dev/tests/acceptance/
cp /etc/magento/resources/mftf/codeception.dist.yml /var/www/magento2/dev/tests/acceptance/
cp /etc/magento/resources/mftf/functional.suite.yml /var/www/magento2/dev/tests/acceptance/tests/
chown -R www-data ../acceptance &&\
cp .htaccess.sample .htaccess &&\
cd /var/www/magento2 &&\
sudo -u www-data php vendor/bin/mftf build:project