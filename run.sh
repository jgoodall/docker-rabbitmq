#!/bin/bash
if [ ! -f /.rabbitmq_password_set ]; then
  /set_rabbitmq_password.sh
fi

exec supervisord -n -c /etc/supervisor/supervisord.conf