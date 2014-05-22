FROM ubuntu:14.04

MAINTAINER "John Goodall <jgoodall@ornl.gov>"

ENV DEBIAN_FRONTEND noninteractive

# Install basics
RUN apt-get update
RUN apt-get -qy install supervisor curl git

# Install RabbitMQ
RUN apt-get install -qy rabbitmq-server pwgen
RUN rabbitmq-plugins enable rabbitmq_management

EXPOSE 5672
EXPOSE 55672
 
# Copy local files
ADD run.sh /run.sh
ADD set_rabbitmq_password.sh /set_rabbitmq_password.sh
ADD supervisord-rabbitmq.conf /etc/supervisor/conf.d/rabbitmq.conf

RUN chmod 755 /*.sh

CMD ["/run.sh"]