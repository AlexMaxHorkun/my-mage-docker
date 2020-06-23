#!/usr/bin/env bash
php /var/www/magento2/ee/dev/tools/build-ee.php\
 --command=link --ce-source=/var/www/magento2/ --ee-source=/var/www/magento2/ee/
cp /var/www/magento2/ee/composer.json /var/www/magento2/composer.json &&\
cp /var/www/magento2/ee/composer.lock /var/www/magento2/composer.lock