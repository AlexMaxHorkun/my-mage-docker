#!/usr/bin/env bash
cp auth.json /var/www/magento2/auth.json
cp auth.json /root/.composer/auth.json
cd /var/www/magento2 &&\
composer install