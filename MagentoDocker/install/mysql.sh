#!/usr/bin/env bash
bin/echo -e "\n\n\e[1;32m=====================================================================================\e[0m\n\n"
bin/echo -e "\e[1;32mInstalling MySQL\e[0m"
bin/echo -e "\n\n\e[1;32m=====================================================================================\e[0m\n\n"
apt install -yqf debconf-utils
{ \
		echo mysql-community-server mysql-community-server/data-dir select ''; \
		echo mysql-community-server mysql-community-server/root-pass password ''; \
		echo mysql-community-server mysql-community-server/re-root-pass password ''; \
		echo mysql-community-server mysql-community-server/remove-test-db select false; \
	} | debconf-set-selections
apt install -yfq mysql-client\
    mysql-server
service mysql stop
usermod -d /var/lib/mysql/ mysql
chown -R mysql:mysql /var/lib/mysql
service mysql restart
mysql -e "CREATE USER 'magento'@'localhost' IDENTIFIED BY '12345abc';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'magento'@'localhost' WITH GRANT OPTION;"
mysql -e "FLUSH PRIVILEGES;"
mysql -e "CREATE DATABASE magento CHARACTER SET utf8 COLLATE utf8_general_ci;"
mysql -e "CREATE DATABASE magento_integration_tests CHARACTER SET utf8 COLLATE utf8_general_ci;"
mysql -e "set global time_zone = '+00:00'"
bin/echo -e "\n\n\e[1;32m=====================================================================================\e[0m\n\n"
bin/echo -e "\e[1;32mInstalled MySQL\e[0m"
bin/echo -e "\n\n\e[1;32m=====================================================================================\e[0m\n\n"