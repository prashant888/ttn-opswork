#
# Cookbook Name:: fen-rabbitmq
# Recipe:: default
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

node.default['rabbitmq']['default_user'] = 'admin'
node.default['rabbitmq']['default_pass'] = '3Qzd6Uz8'
node.default['rabbitmq']['loopback_users'] = []
node.default['rabbitmq']['enabled_plugins'] = %W[rabbitmq_management rabbitmq_tracing rabbitmq_management_visualiser]

include_recipe 'rabbitmq'
include_recipe 'rabbitmq::mgmt_console'
include_recipe 'rabbitmq::plugin_management'
directory "#{node['rabbitmq']['config_root']}/enabled_plugins" do
  owner 'rabbitmq'
  group 'rabbitmq'
  recursive true
end
rabbitmq_user "guest" do
  action :delete
end
