#!/usr/bin/env bash
cd /var/www/magento2/dev/tests/functional &&\
composer install &&\
cp /etc/magento/resources/mtf/config.xml /var/www/magento2/dev/tests/functional/etc/
cp /etc/magento/resources/mtf/phpunit.xml /var/www/magento2/dev/tests/functional/
chown -R www-data ../functional &&\
sudo -u www-data php utils/generate.php