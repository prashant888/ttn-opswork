#
# Cookbook Name:: fen-database-server
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'fen-base-server'
include_recipe 'nfs::server4'

nfs_export '/srv/nfs' do
  network '10.0.0.0/16'
  writeable false
  sync true
  anonuser 'nobody'
  anongroup 'nogroup'
  options ['all_squash']
end