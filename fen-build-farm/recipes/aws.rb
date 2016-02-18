#
# Cookbook Name:: fen-build-farm
# Recipe:: aws
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

# Install Tomcat/Apache Solr
include_recipe 'fen-aws::learning'

include_recipe 'fen-build-farm::server'