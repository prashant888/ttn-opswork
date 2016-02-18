#
# Cookbook Name:: fen-base-server
# Recipe:: webadmin
# Description:: Creates local webadmin user and install SSH authorized_keys file
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

user_name = 'webadmin'
user_home = "/home/#{user_name}"
user user_name do
  manage_home true
  uid 10001
  gid 10001
  home user_home
  shell '/bin/bash'
end

directory "#{user_home}/.ssh" do
  mode 0700
  owner user_name
  group user_name
  action :create
end

cookbook_file "#{user_home}/.ssh/authorized_keys" do
  source 'webadmin.authorized_keys'
  mode 0600
  owner user_name
  group user_name
  action :create
end