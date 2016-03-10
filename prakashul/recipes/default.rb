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

cookbook_file 'default1' do
  path '/etc/nginx/sites-available/prakashul-default'
  action :create_if_missing
end
  	
service 'tomcat7' do
  supports :restart => true
  action :enable
end



service 'nginx' do
  action [ :enable, :start ]
  supports :reload => true
end
