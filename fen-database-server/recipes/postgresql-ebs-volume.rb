#
# Cookbook Name:: fen-database-server
# Recipe:: postgresql-ebs-volume
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

log 'starting' do
  message 'starting Postgresql volume setup'
  notifies :start, 'service[postgresql]', :immediately
  notifies :stop, 'service[postgresql]', :immediately
end

# /var/lib/pgsql/data
# /usr/share/pgsql

# Create parent directories if needed
dirs = %w[var/lib usr/share etc]
dirs.each do |postgresql_dir|
  directory "/vol/postgresql/#{postgresql_dir}" do
    owner 'root'
    group 'root'
    mode '0755'
    recursive true
    action :create
    not_if { File.exist?("/vol/postgresql/#{postgresql_dir}") }
  end
end

# Move the postgresql data directory to the ebs volume
execute 'move_var_lib_postgresql' do
  command 'mv /var/lib/postgresql /vol/postgresql/var/lib/'
  not_if { File.exist?("/vol/postgresql/var/lib/postgresql") }
  only_if { File.exist?("/var/lib/postgresql") }
end

# Move the postgresql config directory to the ebs volume
execute 'move_usr_share_postgresql' do
  command 'mv /usr/share/postgresql /vol/postgresql/usr/share/'
  not_if { File.exist?("/vol/postgresql/usr/share/postgresql") }
  only_if { File.exist?("/usr/share/postgresql") }
end

# Move the postgresql config directory to the ebs volume
execute 'move_usr_share_postgresql-common' do
  command 'mv /usr/share/postgresql-common /vol/postgresql/usr/share/'
  not_if { File.exist?("/vol/postgresql/usr/share/postgresql-common") }
  only_if { File.exist?("/usr/share/postgresql-common") }
end

# Move the postgresql config directory to the ebs volume
execute 'move_etc_postgresql' do
  command 'mv /etc/postgresql /vol/postgresql/etc'
  not_if { File.exist?('/vol/postgresql/etc/postgresql') }
  only_if { File.exist?('/etc/postgresql') }
end

include_recipe 'fen-base-server::autofs'

template '/etc/auto.master.d/postgresql.autofs' do
  source 'postgresql.autofs.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[autofs]', :delayed
end

template '/etc/auto.postgresql' do
  source 'auto.postgresql.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[autofs]', :immediately
end

log 'cleanup' do
  message 'completing Postgresql volume setup'
  notifies :start, 'service[postgresql]', :immediately
end
