#!/usr/bin/env bash
bin/echo -e "\n\n\e[1;32m=====================================================================================\e[0m\n\n"
bin/echo -e "\e[1;32mInstalling Elasticsearch\e[0m"
bin/echo -e "\n\n\e[1;32m=====================================================================================\e[0m\n\n"

wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.8.0-amd64.deb
sudo dpkg -i elasticsearch-7.8.0-amd64.deb

bin/echo -e "\n\n\e[1;32m=====================================================================================\e[0m\n\n"
bin/echo -e "\e[1;32mInstalled Elasticsearch\e[0m"
bin/echo -e "\n\n\e[1;32m=====================================================================================\e[0m\n\n"
