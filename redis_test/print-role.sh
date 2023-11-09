#!/bin/bash

echo "master IPAddress:"
master_ip=`docker inspect redis-master | grep "IP" | egrep -o "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"`
echo $master_ip;
echo "------------------------------"
echo "slave1 IPAddress:"
slave1_ip=`docker inspect redis-slave1 | grep "IP" | egrep -o "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"`
echo $slave1_ip;
echo "------------------------------"
echo "slave2 IPAddress:"
slave2_ip=`docker inspect redis-slave2 | grep "IP" | egrep -o "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"`
echo $slave2_ip;
echo "------------------------------"


echo -e "\n ============= docker container: redis-master =============\n "
docker exec -it redis-master redis-cli -a sa123456 info Replication | grep role

echo -e "\n ============= docker container: redis-slave1 =============\n "
docker exec -it redis-slave1 redis-cli -a sa123456 info Replication | grep role

echo -e "\n ============= docker container: redis-slave2 =============\n "
docker exec -it redis-slave2 redis-cli -a sa123456 info Replication | grep role

echo -e "\n\n"