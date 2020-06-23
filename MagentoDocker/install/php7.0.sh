#!/usr/bin/env bash
bin/echo -e "\n\n\e[1;32m=====================================================================================\e[0m\n\n"
bin/echo -e "\e[1;32mInstalling PHP 7.0\e[0m"
bin/echo -e "\n\n\e[1;32m=====================================================================================\e[0m\n\n"
apt purge php7.2* -y
apt purge php7.3* -y
apt purge php7.1* -y
apt purge php7.4* -y
apt autoremove -y
add-apt-repository ppa:ondrej/php -y
apt install -yqf\
    php7.0\
    php7.0-fpm\
    php7.0-mysql\
    php7.0-redis\
    php7.0-json\
    php7.0-soap\
    php7.0-xml\
    php7.0-bcmath\
    php7.0-xdebug\
    php7.0-curl\
    php7.0-zip\
    php7.0-mbstring\
    php7.0-gd\
    php7.0-intl\
    php7.0-dev\
    php7.0-mcrypt
sed -i 's/memory_limit = 128M/memory_limit = 4096M/' /etc/php/7.0/fpm/php.ini
sed -i 's/max_execution_time = 30/max_execution_time = 18000/' /etc/php/7.0/fpm/php.ini
sed -i 's/zlib.output_compression = Off/zlib.output_compression = on/' /etc/php/7.0/fpm/php.ini
sed -i 's/max_execution_time = 30/max_execution_time = 18000/' /etc/php/7.0/cli/php.ini
cp /etc/magento/system/resources/magento2_php70.conf /etc/magento/system/resources/magento2.conf
cp /etc/magento/system/resources/xdebug.ini /etc/php/7.0/mods-available/
rm /usr/bin/php && ln -s /usr/bin/php7.0 /usr/bin/php
echo 'PHP_IDE_CONFIG="serverName=mage.ua"' >> /etc/environment
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" &&\
php composer-setup.php &&\
php -r "unlink('composer-setup.php');" &&\
sudo mv composer.phar /usr/local/bin/composer
bin/echo -e "\n\n\e[1;32m=====================================================================================\e[0m\n\n"
bin/echo -e "\e[1;32mInstalled PHP 7.0\e[0m"
bin/echo -e "\n\n\e[1;32m=====================================================================================\e[0m\n\n"