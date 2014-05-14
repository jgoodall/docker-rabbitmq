docker-rabbitmq
===============

Docker image for rabbitmq which will announce its configuration to [etcd](https://github.com/coreos/etcd).

To use Docker on a Mac, install docker and boot2docker:

    brew update
    brew cask install virtualbox
    brew install docker boot2docker
    boot2docker init
    boot2docker up

To build the image:

    docker build -t jgoodall/rabbitmq .

To run the rabbitmq container:

    docker run --name=rabbitmq --rm -e RABBITMQ_PASS="mypass" -p 5672:5672 -p 15672:15672 jgoodall/rabbitmq

To forward ports so you can use `rabbitmqadmin` on your Mac, open new terminals and run the following (and leave the terminals running):

    boot2docker ssh -L 5672:localhost:5672
    boot2docker ssh -L 15672:localhost:15672

To run the container in detached mode:

    rabbitmq=$(docker run --name=rabbitmq -d -e RABBITMQ_PASS="mypass" -p :5672 -p :15672 jgoodall/rabbitmq)
    rmq_port=$(docker port $rabbitmq 5672 | cut -d':' -f2)
    rmq_admin_port=$(docker port $rabbitmq 15672 | cut -d':' -f2)

To push this info to `etcd`:

    etcdctl set /services/rabbitmq/host `hostname`
    etcdctl set /services/rabbitmq/port $rmq_port
    etcdctl set /services/rabbitmq/adminport $rmq_admin_port

To connect from your Mac on the command line:

    rabbitmqadmin -u admin -p mypass -H localhost -P `etcdctl get /services/rabbitmq/adminport` list queues

To use the admin web interface, get the port and then open in a browser (http://localhost:port/):

    etcdctl get /services/rabbitmq/port
