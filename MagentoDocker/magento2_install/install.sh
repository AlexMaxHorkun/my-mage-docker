#!/usr/bin/env bash
mkdir /var/www/magento2/pub/static
cd /var/www/magento2 &&\
chown -R www-data /var/www/magento2

cp /etc/magento/resources/api-functional/install-config-mysql.php /var/www/magento2/dev/tests/api-functional/config/
mv /etc/magento/resources/api-functional/rest.xml dev/tests/api-functional/phpunit.xml
cp /etc/magento/system/resources/local_nginx.conf local_nginx.conf
cp /etc/magento/system/resources/integration/phpunit.xml dev/tests/integration/phpunit.xml
cp /etc/magento/system/resources/integration/phpunit.23.xml dev/tests/integration/phpunit.23.xml
cp /etc/magento/system/resources/integration/config-global.php dev/tests/integration/etc/config-global.php
cp /etc/magento/system/resources/integration/install-config-mysql.php dev/tests/integration/etc/install-config-mysql.php
composer remove magento/magento2-functional-testing-framework

sudo -u www-data php bin/magento setup:install --backend-frontname=admin\
    --amqp-host=127.0.0.1\
    --amqp-user=guest\
    --amqp-password=guest\
    --amqp-port=5672\
    --db-host=magento-mysql\
    --db-name=magento\
    --db-user=magento\
    --db-password=12345abc\
    --base-url=http://mage.ua\
    --timezone=America/Chicago\
    --use-rewrites=1\
    --admin-user=admin\
    --admin-password=12345abc\
    --admin-email=admin@test.com\
    --admin-firstname=admin\
    --elasticsearch-host=magento-elasticsearch\
    --admin-lastname=admin ||\
sudo -u www-data php bin/magento setup:install --backend-frontname=admin\
    --amqp-host=127.0.0.1\
    --amqp-user=guest\
    --amqp-password=guest\
    --amqp-port=5672\
    --db-host=magento-mysql\
    --db-name=magento\
    --db-user=magento\
    --db-password=12345abc\
    --base-url=http://mage.ua\
    --timezone=America/Chicago\
    --use-rewrites=1\
    --admin-user=admin\
    --admin-password=12345abc\
    --admin-email=admin@test.com\
    --admin-firstname=admin\
    --admin-lastname=admin

sudo -u www-data php bin/magento setup:config:set --cache-backend=redis --cache-backend-redis-server=127.0.0.1 --cache-backend-redis-db=0 &&\
sudo -u www-data php bin/magento setup:config:set --page-cache=redis --page-cache-redis-server=127.0.0.1 --page-cache-redis-db=1 &&\
sudo -u www-data php bin/magento setup:config:set --session-save=redis --session-save-redis-host=127.0.0.1 --session-save-redis-log-level=3 --session-save-redis-db=2 &&\
sudo -u www-data php bin/magento config:set admin/security/use_form_key 0 &&\
sudo -u www-data php bin/magento config:set cms/wysiwyg/enabled disabled &&\
sudo -u www-data php bin/magento config:set admin/security/admin_account_sharing 1 &&\
sudo -u www-data php bin/magento config:set system/full_page_cache/caching_application 2 &&\
sudo -u www-data php bin/magento config:set system/full_page_cache/varnish/backend_host "127.0.0.1" &&\
sudo -u www-data php bin/magento config:set system/full_page_cache/varnish/backend_port "8080" &&\
sudo -u www-data php bin/magento cache:flush

service php7.3-fpm stop > /dev/null ||\
service php7.4-fpm stop > /dev/null
service php7.3-fpm start > /dev/null ||\
service php7.4-fpm start > /dev/null
service nginx restart > /dev/null ||\
service apache2 restart > /dev/null
service varnish start
service cron stop
service cron start
service cron restart
