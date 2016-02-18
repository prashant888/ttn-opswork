#
# Cookbook Name:: fen-tveditor
# Recipe:: teachervision
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#
include_recipe "fen-web-server::teachervision"

instance = search('aws_opsworks_instance', 'self:true').first
hostname = instance[:hostname]

vhost = 'www'
domain = 'teachervision.com'
aliases = ["#{hostname}.#{domain}", "#{hostname}-#{vhost}.#{domain}", "#{vhost}-#{hostname}.#{domain}"]
aliases = aliases + node['fen-tveditor']['server-aliases']

# Set up the virtualhosts
web_app "001-#{node['fen-tveditor']['server_name']}" do
  enable true
  server_port 443
  redirect_port 80
  server_name node['fen-tveditor']['server_name']
  server_aliases aliases
  docroot node['fen-tveditor']['deploy_dir']
  scheme 'https'
  template 'teachervision.com.conf.erb'
end

vhost = 'dailyteach'
domain = 'teachervision.com'
aliases = ["#{vhost}.*.#{domain}", "#{hostname}-#{vhost}.#{domain}", "#{vhost}-#{hostname}.#{domain}"]
aliases = aliases + node['fen-tveditor']['dailyteach']['server-aliases']
  
web_app node['fen-tveditor']['dailyteach']['server_name'] do
  enable true
  server_port 80
  redirect_port 443
  server_name node['fen-tveditor']['dailyteach']['server_name']
  server_aliases aliases
  docroot node['fen-tveditor']['deploy_dir']
  scheme 'http'
  #template 'dailyteach.teachervision.com.conf.erb'
  template 'teachervision.com.conf.erb'
end

web_app 'teachervisionsolutions.com' do
  enable true
  template 'teachervisionsolutions.com.conf.erb'
end

web_app '000-teachervision-redirects' do
  enable true
  template 'http-teachervision.com.conf.erb'
end

include_recipe 'fen-tveditor::tv-platform-cron'
