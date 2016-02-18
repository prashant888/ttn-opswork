#
# Cookbook Name:: fen-web-server
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
  
directory "#{node['apache']['docroot_dir']}/.ssh" do
  mode 0700
  owner node['apache']['user']
  group node['apache']['group']
  action :create
end

cookbook_file "#{node['apache']['docroot_dir']}/.ssh/id_ed25519" do
  source 'www-data-id_ed25519'
  mode 0600
  owner node['apache']['user']
  group node['apache']['group']
  action :create
end

directory "/tmp/deploy/.ssh" do
  action :create
  owner 'ubuntu'
  group 'ubuntu'
  mode '0755'
  recursive true
end

cookbook_file '/tmp/deploy/.ssh/deploy-id_rsa' do
  source 'deploy-id_rsa'
  owner 'ubuntu'
  mode '0755'
end

cookbook_file '/tmp/deploy/wrap-ssh4git.sh' do
  source 'wrap-ssh4git.sh'
  owner 'ubuntu'
  mode '0755'
end

include_recipe 'fen-apache2'
include_recipe 'fen-perl'
include_recipe 'fen-php'
php_ini 'apache2' do
  conf_dir '/etc/php5/apache2'
end

link '/etc/php5/apache2/conf.d/include_path.ini' do
  to '/etc/php5/mods-available/include_path.ini'
  only_if { File.exists?('/etc/php5/mods-available/include_path.ini') }
end

# Enable mcrypt
execute "enable mcrypt" do
  command "/usr/sbin/php5enmod mcrypt"
  action :run
  notifies :reload, "service[apache2]", :delayed
end

# Change the ownership to be the apache user
execute "chown-data-www" do
  command "chown -R www-data:www-data #{node['web_app']['base_deploy_dir']}"
  user "root"
  action :run
  notifies :reload, "service[apache2]", :delayed
end
