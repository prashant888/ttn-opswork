#
# Cookbook Name:: fen-database-server
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Declare included recipes
include_recipe 'fen-database-server::default'
include_recipe 'fen-database-server::mysql-ebs-volume'
