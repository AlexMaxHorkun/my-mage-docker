#!/usr/bin/env bash

cd /var/www/magento2
composer config minimum-stability dev
composer config "repositories.bundled" path "./extensions/*/*" &&\
composer require "$1" &&\
chown -R www-data:www-data ./ &&\
sudo -u www-data php bin/magento module:enable --all &&\
sudo -u www-data php bin/magento setup:upgrade
rm -Rf generated/*
redis-cli -r 1 flushall
sudo -u www-data php bin/magento cache:flush
