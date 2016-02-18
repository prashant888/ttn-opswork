#
# Cookbook Name:: fen-site-deploy
# Recipe:: production-ebs-volume
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

# Create the site directory
directory "/site" do
  owner node['apache']['user']
  group node['apache']['user']
  mode '0755'
  recursive true
  action :create
  not_if { File.exist?("/site") }
end

# Create the site directory on the EBS volume
directory "/vol/#{node['fen']['site']['sitegroup']}/site" do
  owner node['apache']['user']
  group node['apache']['user']
  mode '0755'
  recursive true
  action :create
  not_if { File.exist?("/vol/#{node['fen']['site']['sitegroup']}/site") }
end
 
include_recipe 'fen-base-server::autofs'

# Map /site to /vol/site
template '/etc/auto.master.d/site.autofs' do
  source 'site.autofs.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[autofs]', :delayed
end

template '/etc/auto.site' do
  source 'auto.site.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[autofs]', :immediately
end

