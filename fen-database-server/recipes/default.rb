#
# Cookbook Name:: fen-database-server
# Recipe:: default
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

# Declare included recipes
include_recipe 'percona'
include_recipe 'percona::server'

#include_recipe 'percona::configure_server'

if node['percona']['skip_passwords']
  log 'starting' do
    message 'Overriding Percona template'
  end
  
  begin
    r = resources(:template => '/etc/mysql/debian.cnf')
    r.cookbook 'fen-database-server'
    r.source 'debian.cnf.erb'
    r.variables(debian_password: '')
    r.owner 'root'
    r.group 'root'
    r.mode '0640'
    rescue Chef::Exceptions::ResourceNotFound
        Chef::Log.warn 'could not find template to override!'
  end

  log 'finishing' do
    message 'Overriding Percona template'
    notifies :restart, 'service[mysql]', :immediately
  end
end

include_recipe 'percona::toolkit'

log 'finishing' do
  message 'Restarting mysql after installing the Percona toolkit'
  notifies :restart, 'service[mysql]', :immediately
end

package 'mysqltuner' do
  action :install
end