#!/bin/bash

# start etcd
/opt/etcd/etcd

# start rabbitmq
if [ ! -f /.rabbitmq_password_set ]; then
  /set_rabbitmq_password.sh
fi
rabbitmq-server