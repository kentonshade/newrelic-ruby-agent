#!/bin/bash
## start all required services
set -xv
sudo service rabbitmq-server start
sudo service redis-server start
sudo service mongodb start
sudo service memcached start
sudo service mysql start

