VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.hostname = "docker-rabbitmq-vagrant"
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", ip: "172.20.20.12"

  config.vm.provision "docker" do |d|
    d.build_image "/vagrant", args: "-t jgoodall/rabbitmq-etcd"
    d.run "jgoodall/rabbitmq-etcd"
  end

end