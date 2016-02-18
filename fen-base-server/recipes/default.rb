#
# Cookbook Name:: fen-base-server
# Recipe:: default
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

node.override['set_fqdn'] = '*.fen.com'
include_recipe 'hostname'

include_recipe "apt"

%w{moreutils mailutils}.each do |pkg|
  package pkg do
    action :install
  end
end
