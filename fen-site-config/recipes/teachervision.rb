#
# Cookbook Name:: fen-site-config
# Recipe:: teachervision
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#


node.default['fen']['sitevars']['global']['DBRO_HOST'] = node['fen']['sitevars']['global']['DB_HOST']
node.default['fen']['sitevars']['global']['DB_ID_HOST'] = node['fen']['sitevars']['global']['DB_HOST']
node.default['fen']['sitevars']['global']['DB_TV_HOST'] = node['fen']['sitevars']['global']['DB_HOST']
node.default['fen']['sitevars']['global']['DB_MAPS_HOST'] = node['fen']['sitevars']['global']['DB_HOST']

node.default['fen']['sitevars']['legacy']['ip_db_host'] = node['fen']['sitevars']['global']['DB_HOST']
node.default['fen']['sitevars']['legacy']['ip_dbro_host'] = node['fen']['sitevars']['global']['DB_HOST']
node.default['fen']['sitevars']['legacy']['ip_db_id_host'] = node['fen']['sitevars']['global']['DB_HOST']
node.default['fen']['sitevars']['legacy']['ip_db_tv_host'] = node['fen']['sitevars']['global']['DB_HOST']
node.default['fen']['sitevars']['legacy']['ip_db_maps_host'] = node['fen']['sitevars']['global']['DB_HOST']

node.default['fen']['sitevars']['teachervision']['pop_instance_id'] = "#{node['hostname']}_tv_production"

include_recipe 'fen-site-config'

template "#{node['fen']['config_dir']}/prepend-tv.php" do
  action :create
  source 'prepend-tv.php.erb'
  owner node['apache']['user']
  group node['apache']['group']
  mode '0755'
end