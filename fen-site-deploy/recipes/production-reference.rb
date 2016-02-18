#
# Cookbook Name:: fen-site-deploy
# Recipe:: production-reference
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

node.set['fen']['site']['sitegroup'] = 'reference'
node.set['fen']['site']['directories'] = %w[bin cgi-bin data html lib]

include_recipe 'fen-site-deploy::production'

# Create the new library code deployment directory
%w(cache tmp).each do |site_dir|
  directory "/site/#{site_dir}" do
    action :create
    owner node['apache']['user']
    group node['apache']['user']
    mode '0755'
  end
end