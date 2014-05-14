VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = "docker-rabbitmq-vagrant"
  config.vm.box = "misheska/ubuntu1404-docker"
  config.vm.network "private_network", ip: "172.20.20.12"
end