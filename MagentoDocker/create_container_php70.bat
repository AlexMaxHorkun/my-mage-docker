docker build . -t magento2 --no-cache --build-arg php_ver=7.0 && docker run -td --name magento2 -p 80:80 -p 22222:22 -p 4433:443 magento2