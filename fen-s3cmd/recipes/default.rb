#
# Cookbook Name:: fen-s3cmd
# Recipe:: default
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

require 'chef/data_bag'

# Load the databag that holds the AWS keys
fen_aws = Chef::DataBagItem.load('fen-aws', 'access-keys')

node.default['s3cmd']['access_key_id'] = fen_aws['access_key_id']
node.default['s3cmd']['secret_access_key'] = fen_aws['secret_access_key']

# Install s3cmd
package "s3cmd" do 
  action :install
end

# Deploy s3cmd configuration for each user. 
node['s3cmd']['users'].each do |user| 
  home = user == 'root' ? '/root' : "/home/#{user}"
  template 's3cfg' do
      path "#{home}/.s3cfg"
      source 's3cfg.erb'
      mode 0655
  end  
end