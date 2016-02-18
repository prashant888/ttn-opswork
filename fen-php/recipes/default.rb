#
# Cookbook Name:: fen-php
# Recipe:: default
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

require 'chef/log'

include_recipe 'php'

template "#{node['php']['conf_dir']}/conf.d/40-include_path.ini" do
  source 'include_path.ini.erb'
  unless platform?('windows')
    owner 'root'
    group node['root_group']
    mode '0644'
  end
end

template "#{node['php']['apache2']['conf_dir']}/conf.d/40-include_path.ini" do
  source 'include_path.ini.erb'
  unless platform?('windows')
    owner 'root'
    group node['root_group']
    mode '0644'
  end
end

# Configure opcache
template "#{node['php']['apache2']['conf_dir']}/conf.d/05-opcache.ini" do
  Chef::Log.info("Setting up opcache")
  source 'opcache.ini.erb'
  manage_symlink_source true
  unless platform?('windows')
    owner 'root'
    group node['root_group']
    mode '0644'
  end
end
      
node['php']['modules'].each do |module_name, flag|
  if flag
    Chef::Log.info("Installing PHP module #{module_name}")
    package module_name do
      action :install
    end  
    
    if node['php']['config'].has_key? "#{module_name}"
      Chef::Log.info("Configuring PHP module #{module_name}")
      Chef::Log.info("Installing template in #{node['php']['config']["#{module_name}"]['config_file']}")
      template "#{node['php']['config']["#{module_name}"]['config_file']}" do
        Chef::Log.info("Setting up template #{node['php']['config']["#{module_name}"]['template']}")
        source node['php']['config']["#{module_name}"]['template']
        manage_symlink_source true
        unless platform?('windows')
          owner 'root'
          group node['root_group']
          mode '0644'
        end
      end
    else 
      Chef::Log.info("No specific configuration for PHP module #{module_name}")
    end
  end
end