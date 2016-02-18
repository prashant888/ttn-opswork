#
# Cookbook Name:: fen-site-deploy
# Recipe:: services-stack
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

require 'chef/log'

node.override['fen']['site']['directories'] = %w[bin cfg lib]
node.override['fen']['site']['sitegroup'] = 'teachervision'
node.override['apache']['user'] = 'webadmin'
  
include_recipe 'fen-site-deploy::production'