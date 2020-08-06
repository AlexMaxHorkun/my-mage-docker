#!/usr/bin/env bash
service nginx stop
service php7.4-fpm stop
service php7.3-fpm stop
service elasticsearch start
service php7.4-fpm start ||\
service php7.3-fpm start
service nginx start
service varnish start
