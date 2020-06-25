# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'.freeze

# workaround for dhcp issue: https://github.com/hashicorp/vagrant/issues/11403
class VagrantPlugins::ProviderVirtualBox::Action::Network
  def dhcp_server_matches_config?(dhcp_server, config)
    true
  end
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define 'docker', primary: true do |docker|
    docker.vm.hostname = 'build-your-own-radar-docker'
    docker.vm.provision 'shell', path: 'bash/copy-ssh-key.sh', args: 'docker'

    docker.vm.provision 'shell', privileged: true, run: 'always', inline: <<-SHELL
      chgrp vagrant /var/run/docker.sock
    SHELL

    docker.vm.provider :docker do |d|
      d.image = 'docker.myob.com/sme-employers/build-your-own-radar-development'
      d.remains_running = true
      d.has_ssh = true
      d.pull = true
      d.create_args = [
        '-v', '//var/run/docker.sock:/var/run/docker.sock',
        '-v', "#{ENV['HOME']}/.docker:/home/vagrant/.docker"
      ]
      d.cmd = [
        '/usr/sbin/sshd',
        '-D'
      ]
    end
  end

  config.vm.define 'virtualbox' do |virtualbox|
    virtualbox.vm.box = 'bento/debian-9.5'

    virtualbox.vm.hostname = 'build-your-own-radar-virtualbox'
    virtualbox.vm.network :private_network, type: 'dhcp'

    virtualbox.vm.synced_folder "#{Dir.home}/.docker", '/home/vagrant/.docker'

    virtualbox.vm.provision 'shell', path: 'bash/copy-ssh-key.sh', args: 'virtualbox'
    virtualbox.vm.provision 'shell', path: 'bash/provision-virtualbox.sh'

    virtualbox.cache.scope = :machine if Vagrant.has_plugin?('vagrant-cachier')

    virtualbox.vm.provider :virtualbox do |vb|
      vb.cpus = 2
      vb.memory = 1024
    end
  end
end
