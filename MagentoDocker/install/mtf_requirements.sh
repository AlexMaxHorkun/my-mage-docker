#!/usr/bin/env bash
apt install -yqf libdbus-glib-1-2 libgtk2.0-0 &&\
tar -xvjf /etc/magento/resources/mtf/firefox45.tar.bz2 -C /etc &&\
ln -s /etc/firefox/firefox /usr/bin/firefox &&\
mkdir /etc/magento/mtf && mkdir /etc/magento/mtf/logs