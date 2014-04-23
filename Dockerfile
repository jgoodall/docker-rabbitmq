FROM ubuntu:14.04

MAINTAINER "John Goodall <jgoodall@ornl.gov>"

# Install basics
RUN apt-get update
RUN apt-get install -y curl git

# Install RabbitMQ
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y upgrade && DEBIAN_FRONTEND=noninteractive apt-get install -y rabbitmq-server pwgen
RUN rabbitmq-plugins enable rabbitmq_management

EXPOSE 5672
EXPOSE 55672
 
# Install etcd
RUN curl -L https://github.com/coreos/etcd/releases/download/v0.3.0/etcd-v0.3.0-linux-amd64.tar.gz | tar xzf - && mv etcd-v0.3.0-linux-amd64 /opt/etcd

EXPOSE 4001
EXPOSE 7001

# Copy local files
ADD run.sh /run.sh
ADD set_rabbitmq_password.sh /set_rabbitmq_password.sh

RUN chmod 755 /*.sh

CMD ["/run.sh"]