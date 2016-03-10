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
  	
cookbook_file '/etc/nginx/sites-available/default-prakashul' do
  source 'default1'
  mode '0644'
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
