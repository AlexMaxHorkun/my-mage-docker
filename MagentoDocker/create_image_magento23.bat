docker buildx build . -t ogorkunad/magento-env-23:0.9 --no-cache --build-arg php_ver=7.3 --platform=linux/amd64,linux/arm64/v8 --push