#
# Cookbook Name:: fen-database-server
# Recipe:: postgresql-on-ebs
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

# Declare included recipes
include_recipe 'fen-database-server::tveditor'
include_recipe 'fen-database-server::postgresql-ebs-volume'
