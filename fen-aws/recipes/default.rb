#
# Cookbook Name:: fen-aws
# Recipe:: default
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

# Seahorse::Client::NetworkingError
# https://github.com/chef-cookbooks/aws/issues/153
if node['platform_family'] == 'windows'
  cookbook_file "#{Chef::Config[:file_cache_path]}/ca-bundle.crt" do
    source 'ca-bundle.crt'
  end
  aws.config[:ssl_ca_bundle] = "#{Chef::Config[:file_cache_path]}/ca-bundle.crt"
end

include_recipe 'aws'

require 'chef/data_bag'

unless Chef::DataBag.list.key?('fen-aws')
  new_databag = Chef::DataBagItem.new
  new_databag.data_bag('fen-aws')
  fen_aws_credentials = {
      'id' => 'access-keys',
      'access_key_id' => 'AKIAI2N4LDHWU36MRAIA',
      'secret_access_key' => '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'
  }
  new_databag.raw_data = fen_aws_credentials
  new_databag.save
end
