#
# Cookbook Name:: fen-site-deploy
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

require 'chef/log'
 
include_recipe 'fen-base-server::aws-site'
include_recipe 'fen-mail-relay::client'

directory '/var/www/.ssh' do
  owner node['apache']['user']
  group node['apache']['group']
  mode '0700'
end

cookbook_file '/var/www/.ssh/id_ed25519' do
  source 'deployment'
  owner node['apache']['user']
  group node['apache']['group']
  mode '0600'
end

cookbook_file '/etc/ssh/ssh_known_hosts' do
  source 'ssh_known_hosts'
  owner node['apache']['user']
  group node['apache']['group']
  mode '0644'
end

command = node['fen']['site']['deploy']['command']
optlist = node['fen']['site']['deploy']['flags']
origin  = node['fen']['site']['deploy']['origin']
sitegroup = node['fen']['site']['sitegroup']

# Create the /site directories
node['fen']['site']['directories'].each do |site_dir|
  `mkdir -p /site/#{site_dir}`
  `chown -R #{node['apache']['user']}:#{node['apache']['group']} /site/#{site_dir}`
end

# Create the /site directories
node['fen']['site']['directories'].each do |site_dir|
  # Copy the files from the NFS server
  bash 'staging copy' do
    action :run
    user 'root'
    code <<-EOH
    #{command} #{optlist} #{origin}/#{sitegroup}/site/#{site_dir} /site/
    EOH
    not_if { ::File.directory?("/site/#{site_dir}") }
  end
end
