#
# Cookbook Name:: fen-build-farm
# Recipe:: default
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

credentials = search('jenkins').first
node.run_state[:jenkins_private_key] = credentials['private_key']
node.run_state[:jenkins_username] = 'karl.debisschop@fen.com'

include_recipe 'fen-ssl::fen'
include_recipe 'jenkins::java'

cookbook_file "/etc/ssl/jenkins.jks" do
  owner 'root'
  group 'root'
  mode '0644'
  source 'jenkins.jks'
end

include_recipe 'jenkins::master'

package 'ant'
package 'subversion'

include_recipe 'fen-php'

directory node['composer']['cache_dir'] do
  owner 'root'
  group 'root'
  mode '0775'
end
include_recipe 'composer'

qa_tools_dir = '/opt/phpqatools'
composer_json = 'composer.json'
directory qa_tools_dir do
  owner 'root'
  group 'root'
  mode '0775'
end
cookbook_file "#{qa_tools_dir}/#{composer_json}" do
  owner 'root'
  group 'root'
  source composer_json
end
composer_project 'phpqatools' do
  project_dir qa_tools_dir
  optimize_autoloader true
  action :install
end

include_recipe 'iptables'

iptables_rule 'http' do
  action :enable
end

iptables_rule 'http_8080' do
  action :enable
end

include_recipe 'fen-build-farm::plugins'
#include_recipe 'fen-build-farm::credentials'
#include_recipe 'fen-build-farm::jobs'
