#!/bin/bash
## start all required services
set -xv
service rabbitmq-server start
service redis-server start
service mongodb start
service memcached start
service mysql start

