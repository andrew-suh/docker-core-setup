Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.define "docker.local"
  config.vm.hostname = "docker.local"
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.network "private_network", ip: "###.###.##.#"
  config.vm.network "forwarded_port", guest: 2375, host: 2375, id: "dockerd"
  config.vm.provider "virtualbox" do |vb|
    vb.name = "ubuntu-docker"
    vb.memory = "2048"
    vb.cpus = "2"
  end
  config.vm.provision "shell", path: "setup.sh"
end
