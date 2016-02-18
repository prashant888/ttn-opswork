#
# Cookbook Name:: fen-utility-stack
# Recipe:: default
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

user 'www' do
  manage_home true
  home '/home/www'
  shell '/bin/bash'
end

cookbook_file '/site/cfg/datasources.ini' do
  source 'datasources.ini'
  owner node['apache']['user']
  group node['apache']['user']
  mode '0644'
end

include_recipe 'fen-utility-stack::fetch-delta-since-cron'
include_recipe 'fen-utility-stack::responsys-ced-cron'
include_recipe 'fen-utility-stack::supervisor'