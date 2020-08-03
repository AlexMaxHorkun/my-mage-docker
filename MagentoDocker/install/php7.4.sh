#!/usr/bin/env bash
bin/echo -e "\n\n\e[1;32m=====================================================================================\e[0m\n\n"
bin/echo -e "\e[1;32mInstalling PHP 7.4\e[0m"
bin/echo -e "\n\n\e[1;32m=====================================================================================\e[0m\n\n"
apt purge php7.2* -y
apt purge php7.3* -y
apt purge php7.1* -y
apt purge php7.4* -y
apt autoremove -y
add-apt-repository ppa:ondrej/php -y
apt install -yqf\
    php7.4\
    php7.4-fpm\
    php7.4-mysql\
    php7.4-redis\
    php7.4-json\
    php7.4-soap\
    php7.4-xml\
    php7.4-bcmath\
    php7.4-xdebug\
    php7.4-curl\
    php7.4-zip\
    php7.4-mbstring\
    php7.4-gd\
    php7.4-intl\
    php7.4-dev
sed -i 's/memory_limit = 128M/memory_limit = 4096M/' /etc/php/7.4/fpm/php.ini
sed -i 's/max_execution_time = 30/max_execution_time = 18000/' /etc/php/7.4/fpm/php.ini
sed -i 's/zlib.output_compression = Off/zlib.output_compression = on/' /etc/php/7.4/fpm/php.ini
sed -i 's/max_execution_time = 30/max_execution_time = 18000/' /etc/php/7.4/cli/php.ini
cp /etc/magento/system/resources/xdebug.ini /etc/php/7.4/mods-available/
echo 'PHP_IDE_CONFIG="serverName=mage.ua"' >> /etc/environment
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" &&\
php composer-setup.php &&\
php -r "unlink('composer-setup.php');" &&\
sudo mv composer.phar /usr/local/bin/composer
bin/echo -e "\n\n\e[1;32m=====================================================================================\e[0m\n\n"
bin/echo -e "\e[1;32mInstalled PHP 7.4\e[0m"
bin/echo -e "\n\n\e[1;32m=====================================================================================\e[0m\n\n"