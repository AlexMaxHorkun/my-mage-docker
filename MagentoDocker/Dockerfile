FROM ubuntu:20.04
ARG php_ver=7.4
COPY install/basics.sh /etc/magento/system/install/
COPY install/nginx.sh /etc/magento/system/install/
COPY install/mysql.sh /etc/magento/system/install/
COPY install/php${php_ver}.sh /etc/magento/system/install/php.sh
COPY install/rabbitmq.sh /etc/magento/system/install/
COPY install/redis.sh /etc/magento/system/install/
COPY install/functional_tests_requirements.sh /etc/magento/system/install/
COPY install/mtf_requirements.sh /etc/magento/system/install/
COPY install/mftf_requirements.sh /etc/magento/system/install/
COPY install/finalize.sh /etc/magento/system/install/
COPY install/varnish.sh /etc/magento/system/install/
COPY install/elasticsearch.sh /etc/magento/system/install/
COPY resources/magento2.conf /etc/magento/system/resources/
COPY resources/magento2SSL.conf /etc/magento/system/resources/
COPY resources/local_nginx.conf /etc/magento/system/resources/
COPY resources/magento2_php71.conf /etc/magento/system/resources/
COPY resources/magento2_php70.conf /etc/magento/system/resources/
COPY resources/magento2_php73.conf /etc/magento/system/resources/
COPY resources/magento2_php74.conf /etc/magento/system/resources/
COPY resources/magento2SSL_php73.conf /etc/magento/system/resources/
COPY resources/xdebug.ini /etc/magento/system/resources/
COPY init/init.sh /etc/magento/system/init/
COPY magento2_install /etc/magento/magento2/install/
COPY resources/mtf /etc/magento/resources/mtf/
COPY resources/mftf /etc/magento/resources/mftf/
COPY resources/api-functional /etc/magento/resources/api-functional/
COPY resources/crontab /etc/magento/system/resources/
COPY resources/varnish/ /etc/magento/system/resources/varnish/
EXPOSE 80 443 22
USER root
RUN /etc/magento/system/install/basics.sh
RUN /etc/magento/system/install/mysql.sh
RUN /etc/magento/system/install/php.sh
RUN /etc/magento/system/install/nginx.sh
RUN /etc/magento/system/install/rabbitmq.sh
RUN /etc/magento/system/install/redis.sh
RUN /etc/magento/system/install/functional_tests_requirements.sh
RUN /etc/magento/system/install/mtf_requirements.sh
RUN /etc/magento/system/install/mftf_requirements.sh
RUN /etc/magento/system/install/varnish.sh
RUN /etc/magento/system/install/elasticsearch.sh
RUN /etc/magento/system/install/finalize.sh
CMD /etc/magento/system/init/init.sh && bin/bash