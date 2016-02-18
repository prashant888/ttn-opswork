#
# Cookbook Name:: fen-database-server
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'fen-nfs-server::default'
include_recipe 'fen-users::webadmin'

directory '/srv/nfs/staging' do
  owner 'webadmin'
  group 'webadmin'
  mode '0755'
  action :create
end
