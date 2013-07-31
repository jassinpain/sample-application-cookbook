
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

    # virtualbox customizations for local deployment
    sample_app_config.vm.provider :virtualbox do |vbox, override|
      override.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/opscode_ubuntu-13.04_provisionerless.box"
      override.vm.hostname = "sample-app.local"
      override.vm.network :private_network, ip: "33.33.40.15" 
    
      vbox.customize ["modifyvm", :id, "--name", "sample-app.local"] 
    end
    
    # managed-server customizations for deployment in azure
    sample_app_config.vm.provider :managed do |managed, override|
      override.vm.box_url = "https://github.com/tknerr/vagrant-managed-servers/raw/master/dummy.box"
      override.ssh.username = "ubuntu"
      # see http://www.windowsazure.com/en-us/manage/linux/how-to-guides/ssh-into-linux/
      override.ssh.private_key_path = 'W:\home\.ssh\azure-dev-cert.key'

      managed.server = "tkntest123.cloudapp.net"
    end

    # provisioning
    sample_app_config.vm.provision :chef_solo do |chef|
      chef.add_recipe "sample-app"
      chef.json = {
        :sample_app => {
          :words_of_wisdom => "Chuck Norris's beard can type 140 wpm!"
        }
      }
    end
  end 
end
