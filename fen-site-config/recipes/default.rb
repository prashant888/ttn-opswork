#
# Cookbook Name:: fen-site-config
# Recipe:: default
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

# Create the new config directory
directory node['fen']['config_dir'] do
  action :create
  owner node['apache']['user']
  group node['apache']['group']
  mode '0755'
  recursive true
end

# Create the datasources.ini file 
template "#{node['fen']['config_dir']}/datasources.ini" do
  action :create
  source 'datasources.ini.erb'
  owner node['apache']['user']
  group node['apache']['group']
  mode '0644'
end

# Create the prepend.php file 
template "#{node['fen']['config_dir']}/prepend.php" do
  action :create
  source 'prepend.php.erb'
  owner node['apache']['user']
  group node['apache']['group']
  mode '0644'
end

# Set up a symlink to legacy prepend.php3
link "#{node['fen']['config_dir']}/prepend.php3" do
  to "#{node['fen']['config_dir']}/prepend.php"
  owner node['apache']['user']
  group node['apache']['group']
end

# Create the prepend.php file 
template "#{node['fen']['config_dir']}/sitevars.pm" do
  action :create
  source 'sitevars.pm.erb'
  owner node['apache']['user']
  group node['apache']['group']
  mode '0644'
end