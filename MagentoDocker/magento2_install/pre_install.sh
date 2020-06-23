#!/usr/bin/env bash
cp auth.json /var/www/magento2/auth.json
php /var/www/magento2/ee/dev/tools/build-ee.php\
 --command=link --ce-source=/var/www/magento2/ --ee-source=/var/www/magento2/ee/
cp /var/www/magento2/ee/composer.json /var/www/magento2/composer.json &&\
cp /var/www/magento2/ee/composer.lock /var/www/magento2/composer.lock
php /var/www/magento2/ee/dev/tools/build-ee.php --command=link --ce-source=/var/www/magento2/ --ee-source=/var/www/magento2/b2b/
php /var/www/magento2/ee/dev/tools/build-ee.php --command=link --ce-source=/var/www/magento2/ --ee-source=/var/www/magento2/sample-data/
php /var/www/magento2/ee/dev/tools/build-ee.php --command=link --ce-source=/var/www/magento2/ --ee-source=/var/www/magento2/sample-data-ee/
mkdir /var/www/magento2/pub/static
cd /var/www/magento2
cp /etc/magento/resources/api-functional/install-config-mysql.php /var/www/magento2/dev/tests/api-functional/config/
mv /etc/magento/resources/api-functional/rest.xml dev/tests/api-functional/phpunit.xml
cp /etc/magento/system/resources/local_nginx.conf local_nginx.conf
composer install
chown -R www-data /var/www/magento2
service nginx stop
service php7.2-fpm stop
echo "" >> /etc/php/7.2/mods-available/xdebug.ini
echo "xdebug.remote_autostart=On" >> /etc/php/7.2/mods-available/xdebug.ini
echo "" >> /etc/php/7.2/mods-available/xdebug.ini
service php7.2-fpm start
service nginx start
service cron stop
service cron start
service cron restart
