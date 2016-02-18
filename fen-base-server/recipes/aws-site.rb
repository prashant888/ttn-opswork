#
# Cookbook Name:: fen-base-server
# Recipe:: aws-site
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'fen-base-server::aws'
include_recipe 'nfs::client4'
include_recipe 'fen-base-server::autofs'

template '/etc/auto.master.d/staging.autofs' do
  source 'staging.autofs'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[autofs]', :delayed
end

template '/etc/auto.staging' do
  source 'auto.staging'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[autofs]', :delayed
end


