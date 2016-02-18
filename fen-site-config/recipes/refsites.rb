#
# Cookbook Name:: fen-site-config
# Recipe:: familyeducation
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'fen-site-config::_database'

node.default['fen']['sitevars']['global']['DBRO_HOST'] = node['fen']['sitevars']['global']['DB_HOST']
node.default['fen']['sitevars']['global']['DB_ID_HOST'] = node['fen']['sitevars']['global']['DB_HOST']
node.default['fen']['sitevars']['global']['DB_TV_HOST'] = node['fen']['sitevars']['global']['DB_HOST']
node.default['fen']['sitevars']['global']['DB_MAPS_HOST'] = node['fen']['sitevars']['global']['DB_HOST']

node.default['fen']['sitevars']['legacy']['ip_db_host'] = node['fen']['sitevars']['global']['DB_HOST']
node.default['fen']['sitevars']['legacy']['ip_dbro_host'] = node['fen']['sitevars']['global']['DB_HOST']
node.default['fen']['sitevars']['legacy']['ip_db_id_host'] = node['fen']['sitevars']['global']['DB_HOST']
node.default['fen']['sitevars']['legacy']['ip_db_tv_host'] = node['fen']['sitevars']['global']['DB_HOST']
node.default['fen']['sitevars']['legacy']['ip_db_maps_host'] = node['fen']['sitevars']['global']['DB_HOST']

include_recipe 'fen-site-config'

template "#{node['fen']['config_dir']}/prepend-refsites.php" do
  action :create
  source 'prepend.php.erb'
  owner node['apache']['user']
  group node['apache']['group']
  mode '0755'
end

template "#{node['fen']['config_dir']}/prepend-ip.php" do
  action :create
  source 'prepend.php.erb'
  owner node['apache']['user']
  group node['apache']['group']
  mode '0755'
end
