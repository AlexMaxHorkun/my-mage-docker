docker network create -d bridge magento2-network
docker run -td --name "magento-mysql" -p 23306:3306 --network "magento2-network" ogorkunad/magento-mysql-80:1.0\
&& docker run -td --name "magento-varnish" -p 80:80 --network "magento2-network" ogorkunad/magento-varnish:0.9\
&& docker run -td -e "discovery.type=single-node" --name magento-elasticsearch --network "magento2-network" docker.elastic.co/elasticsearch/elasticsearch:7.13.1\
&& docker run -td --name "magento" -p 8080:8080 -p 22222:22 --network "magento2-network" ogorkunad/magento-env-24:0.9
