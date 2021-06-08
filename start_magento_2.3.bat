docker network create -d bridge magento2-network
docker run -td --name "magento-mysql" -p 23306:3306 --network "magento2-network" mysql57\
&& docker run -td --name magento23 -p 80:80 -p 22222:22 -p 4433:443 --network "magento2-network" magento23\
&& docker run -td -e "discovery.type=single-node" --name magento-elasticsearch --network "magento2-network" docker.elastic.co/elasticsearch/elasticsearch:7.13.1