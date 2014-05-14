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

    docker run --name=rabbitmq --rm -e RABBITMQ_PASS="mypass" -p 5672:5672 -p 55672:55672 jgoodall/rabbitmq

To forward ports so you can use on your Mac:

    boot2docker ssh -L 5672:localhost:5672
    boot2docker ssh -L 55672:localhost:55672

To run the container and set up `etcd` for configuration:

    docker run --name=rabbitmq --rm -e RABBITMQ_PASS="mypass" -p 5672:5672 -p 55672:55672 jgoodall/rabbitmq