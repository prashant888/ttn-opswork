#
# Cookbook Name:: fen-build-farm
# Recipe:: default
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

# Install Java 7
node.default['java']['jdk_version'] = '7'
include_recipe 'java'

