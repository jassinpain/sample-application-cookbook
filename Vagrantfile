
Vagrant::configure("2") do |config|

  # enable cachier
  config.cache.auto_detect = true
  # the Chef version to use
  config.omnibus.chef_version = "11.4.4"
  # enable berkshelf plugin
  config.berkshelf.enabled = true
  
  #
  # define the sample-app VM
  #
  config.vm.define :"sample-app" do | sample_app_config |
    
    # configure the basebox
    sample_app_config.vm.box = "opscode_ubuntu-13.04_provisionerless"

    # configure host-only network
    sample_app_config.vm.hostname = "sample-app.local"

    # virtualbox customizations
    sample_app_config.vm.provider :virtualbox do |vbox, override|
      override.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/opscode_ubuntu-13.04_provisionerless.box"
      override.vm.network :private_network, ip: "33.33.40.15"

      vbox.customize ["modifyvm", :id,
        "--name", "sample-app.local"
      ]
    end

    # lxc provider customizations
    sample_app_config.vm.provider :lxc do |lxc, override|
      override.vm.box_url = "http://bit.ly/vagrant-lxc-raring64-2013-07-12"
      lxc.sudo_wrapper = "/usr/bin/lxc-vagrant-wrapper"
    end
    
    # provisioning
    sample_app_config.vm.provision :chef_solo do |chef|
      chef.add_recipe "sample-app"
      chef.json = {
        :sample_app => {
          :words_of_wisdom => "Chuck Norris' beard can type 140 wpm!"
        }
      }
    end
  end 
end
