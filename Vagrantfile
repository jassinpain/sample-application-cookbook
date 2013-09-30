
Vagrant::configure("2") do |config|

=begin
  # enable cachier
  config.cache.auto_detect = true
  # the Chef version to use
  config.omnibus.chef_version = "11.6.0"
  # enable berkshelf plugin
  config.berkshelf.enabled = true
=end

  #
  # define the sample-app VM
  #
  config.vm.define :"sample-app" do | sample_app_config |
    
    # configure the basebox
    sample_app_config.vm.box = "opscode_ubuntu-13.04_provisionerless"
    # configure host-only network
    sample_app_config.vm.hostname = "sample-app.local"
    sample_app_config.vm.network :private_network, ip: "33.33.40.15" 

    # virtualbox-specific customizations
    sample_app_config.vm.provider :virtualbox do |vbox, override|
      override.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/opscode_ubuntu-13.04_provisionerless.box"
      vbox.customize ["modifyvm", :id, "--name", "sample-app.local"] 
    end

    # vcloud-specific customizations
    sample_app_config.vm.provider :vcloud do |vcloud, override|
      override.vm.box = "precise32"
      override.vm.box_url = "http://vagrant.tsugliani.fr/precise32.box"
      #override.vm.box = "Ubuntu_Vagrantbox"
      #override.vm.box_url = "https://github.com/tknerr/vagrant-vcloud/raw/develop_experimenting/dummy.box"
      vcloud.hostname = "https://v-swd-vcld02"
      vcloud.org_name = "qa"
      vcloud.username = ENV['VCLOUD_API_USER']
      vcloud.password = ENV['VCLOUD_API_PASS']
      #vcloud.catalog_name = "vagrant"
      vcloud.catalog_item_name = "ubuntu"
      vcloud.vdc_name = "QA vDC"
      vcloud.vdc_network_name = "QA direct connect 2 HGNet"
    end

    
    # provisioning
    sample_app_config.vm.provision :chef_solo do |chef|
      chef.add_recipe "sample-app"
      chef.json = {
        :sample_app => {
          :words_of_wisdom => "Chuck Norris' beard can type 140 wpm!"
        }
      }
      chef.log_level = :debug
    end
  end 
end
