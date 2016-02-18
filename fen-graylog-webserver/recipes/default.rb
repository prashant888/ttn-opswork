#
# Cookbook Name:: fen-graylog-webserver
# Recipe:: default
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

# Set Java installation attributes
node.override['java']['jdk_version'] = '8'
node.override['java']['install_flavor'] = 'oracle'
node.override['java']['oracle']['accept_oracle_download_terms'] = 'true'
 
# Set graylog2 web app attributes   
node.default['graylog2']['web']['secret'] = 'yNYeZFx6tsUxrsh0Sn4Pp4iF6E3PyGe9DerddrP7dsVMH7zFvtGQJdMJ5ROCv5vMVQtqfLu3jJ4sQk8sUZ6KJATrPDnGqMyj'
node.default['graylog2']['web']['server_backends'] = 'http://syslog.fen.com:12900'  
  
include_recipe 'java'  
include_recipe 'graylog2::default'
include_recipe 'graylog2::web'