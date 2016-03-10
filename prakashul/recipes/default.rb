#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package 'nginx' do
	action :install
end

package 'tomcat7' do
        action :install
end

file "/etc/nginx/sites-available/default" do
 action :delete
end

file "/etc/nginx/sites-available/default" do
  owner 'root'
  group 'root'
  mode 0755
  content ::File.open("/var/chef/cookbooks/prakashul/files/default/default1").read
  action :create
  notifies :reload, "service[nginx]"
  notifies :restart, "service[tomcat7]"
end
  	
service 'tomcat7' do
  supports :restart => true
  action :enable
end

service 'nginx' do
  action [ :enable, :start ]
  supports :reload => true
end
