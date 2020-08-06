#!/usr/bin/env bash
cd /var/www/magento2
composer config minimum-stability dev
composer config repositories.security-package path "./security-package/*"
composer require magento/security-package
sudo -u www-data php bin/magento module:enable --all
sudo -u www-data php bin/magento setup:upgrade
sudo -u www-data php bin/magento cache:flush
