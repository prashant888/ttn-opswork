#
# Cookbook Name:: fen-database-server
# Recipe:: mysql-ebs-volume
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

log 'starting' do
  message 'starting mysql volume setup'
  notifies :start, 'service[mysql]', :immediately
  notifies :stop, 'service[mysql]', :immediately
end

# Create parent directories if needed
dirs = %w[var/lib var/log etc]
dirs.each do |mysql_dir|
  directory "/vol/mysql/#{mysql_dir}" do
    owner 'root'
    group 'root'
    mode '0755'
    recursive true
    action :create
    not_if { File.exist?("/vol/mysql/#{mysql_dir}") }
  end
end

directory '/vol/mysql/var/log/mysqlbin' do
  owner 'mysql'
  group 'adm'
  mode '0755'
  action :create
  not_if { File.exist?('/vol/mysql/var/log/mysqlbin') }
end

execute 'move_etc_mysql' do
  command 'mv /etc/mysql /vol/mysql/etc/'
  only_if { File.exist?("/etc/mysql") }
  not_if { File.exist?("/vol/mysql/etc/mysql") }
end

execute 'move_var_lib_mysql' do
  command 'mv /var/lib/mysql /vol/mysql/var/lib/'
  only_if { File.exist?("/var/lib/mysql") }
  not_if { File.exist?("/vol/mysql/var/lib/mysql") }
end

execute 'move_var_log_mysqlbin' do
  command 'mv /var/log/mysqlbin /vol/mysql/var/log/'
  only_if { File.exist?("/var/log/mysqlbin") }
  not_if { File.exist?("/vol/mysql/var/log/mysqlbin") }
end

include_recipe 'fen-base-server::autofs'

template '/etc/auto.master.d/mysql.autofs' do
  source 'mysql.autofs.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[autofs]', :delayed
end

template '/etc/auto.mysql' do
  source 'auto.mysql.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[autofs]', :immediately
end

log 'cleanup' do
  message 'completing mysql volume setup'
  notifies :start, 'service[mysql]', :immediately
end
