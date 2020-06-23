#!/usr/bin/env bash
touch /etc/apt/sources.list.d/google-chrome.list
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
cd /etc/magento/system &&\
wget https://dl.google.com/linux/linux_signing_key.pub &&\
apt install -yqf gpg-agent &&\
apt-key add linux_signing_key.pub &&\
apt update &&\
apt install -yqf google-chrome-stable &&\
chmod +x /etc/magento/resources/mftf/chromedriver &&\
ln -s /etc/magento/resources/mftf/chromedriver /usr/bin/chromedriver &&\
mkdir /etc/magento/mftf && mkdir /etc/magento/mftf/logs