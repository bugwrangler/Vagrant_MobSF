#  MobSF Vagrant setup by bugwrangler 

Vagrant.configure(2) do |config|
	config.vm.box = "ubuntu/trusty64"


    config.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.cpus = 2
    end

    config.vm.network "private_network", ip: "192.168.50.4"
	config.vm.provision :shell, path: "install.sh"
end