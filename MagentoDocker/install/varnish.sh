#!/usr/bin/env bash
bin/echo -e "\n\n\e[1;32m=====================================================================================\e[0m\n\n"
bin/echo -e "\e[1;32mInstalling Varnish\e[0m"
bin/echo -e "\n\n\e[1;32m=====================================================================================\e[0m\n\n"

apt install -yfq varnish
cp /etc/magento/system/resources/varnish/varnish.init.d /etc/init.d/varnish
cp /etc/magento/system/resources/varnish/varnish.default /etc/default/varnish
cp /etc/magento/system/resources/varnish/varnish.vcl /etc/varnish/default.vcl
varnishid=$(ps aux | egrep -io "varnish\s+([0-9]+)" | egrep -o "[0-9]+")
vcacheid=$(ps aux | egrep -io "vcache\s+([0-9]+)" | egrep -o "[0-9]+")
kill -9 "$varnishid" "$vcacheid"
service varnish start
/usr/sbin/varnishreload -m
service varnish reload
varnishid=$(ps aux | egrep -io "varnish\s+([0-9]+)" | egrep -o "[0-9]+")
vcacheid=$(ps aux | egrep -io "vcache\s+([0-9]+)" | egrep -o "[0-9]+")
kill -9 "$varnishid" "$vcacheid"


bin/echo -e "\n\n\e[1;32m=====================================================================================\e[0m\n\n"
bin/echo -e "\e[1;32mInstalled Varnish\e[0m"
bin/echo -e "\n\n\e[1;32m=====================================================================================\e[0m\n\n"
