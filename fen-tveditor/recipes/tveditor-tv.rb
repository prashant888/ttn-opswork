#
# Cookbook Name:: fen-tveditor
# Recipe:: tveditor
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'postgresql::client'
include_recipe 'fen-web-server'
include_recipe 'fen-rabbitmq'

instance = search('aws_opsworks_instance', 'self:true').first
hostname = instance[:hostname]

vhost = 'tveditor'
domain = 'teachervision.com'
web_app "001-tveditor.#{node['fen-tveditor']['server_name']}" do
  enable true
  server_port 443
  redirect_port 80
  server_name 'tveditor.teachervision.com'
  server_aliases ["#{hostname}.#{domain}", "dev-#{vhost}.#{domain}", "#{vhost}-dev.#{domain}", "#{hostname}-#{vhost}.#{domain}", "#{vhost}-#{hostname}.#{domain}"]
  docroot node['fen-tveditor']['deploy_dir']
  scheme 'https'
  template 'teachervision.com.conf.erb'
end

vhost = 'dailyteach'
domain = 'teachervision.com'
web_app "tveditor.#{node['fen-tveditor']['dailyteach']['server_name']}" do
  enable true
  server_port 80
  redirect_port 443
  server_name "tveditor.#{node['fen-tveditor']['dailyteach']['server_name']}"
  server_aliases ["tveditor.#{vhost}.#{domain}", "tveditor.#{vhost}.dev.#{domain}", "dev.tveditor.#{vhost}.#{domain}"]
  docroot node['fen-tveditor']['deploy_dir']
  scheme 'http'
  template 'teachervision.com.conf.erb'
end
