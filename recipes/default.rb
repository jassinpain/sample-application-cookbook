#
# Cookbook Name:: sample-app
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# refresh apt cache
include_recipe "apt"

# ensure default site is enabled and install apache
node.set['apache']['default_site_enabled'] = true
include_recipe "apache2"

# deploy sample html page 
template "/var/www/sample.html" do
  source "sample.html.erb"
  owner node['apache']['user']
  group node['apache']['group']
  mode 00644
  variables(
    :words_of_wisdom => node['sample_app']['words_of_wisdom']
  )
end


node.set['java']['jdk_version'] = "7"
node.set['java']['openjdk_packages'] = ["openjdk-#{node['java']['jdk_version']}-jdk", "default-jre-headless"]

include_recipe "java"
