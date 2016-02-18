#
# Cookbook Name:: fen-base-server
# Recipe:: autofs
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

package 'autofs'

service 'autofs' do
  action [:enable]
end

directory '/etc/auto.master.d' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
  not_if { File.exist?('/etc/auto.master.d') }
end
