#
# Cookbook Name:: fen-apache2
# Recipe:: default
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

# Scheduled updates for GeoIP databases
include_recipe 'fen-apache2::geoip-update'

# Set up global options
node.default['apache']['version'] = '2.4'
node.default['apache']['contact'] = 'webmaster@infoplease.com'
node.default['apache']['timeout'] = 90
node.default['apache']['keepalivetimeout'] = 3
node.default['apache']['keepaliverequests'] = 0
  
# Set up prefork options
node.default['apache']['prefork']['startservers'] = 150
node.default['apache']['prefork']['minspareservers'] = 30
node.default['apache']['prefork']['maxspareservers'] = 100
#node.default['apache']['prefork']['serverlimit'] = 300
node.default['apache']['prefork']['maxrequestworkers'] = 256
node.default['apache']['prefork']['maxclients'] = 300
  
# Security
node.default['apache']['servertokens']    = 'ProductOnly'
node.default['apache']['serversignature'] = 'Off'
node.default['apache']['traceenable']     = 'Off'

# apache2 cookbook gets this wrong for Apache 2.4 on ubuntu -  sets it to /var/www
node.default['apache']['docroot_dir'] = '/var/www/html'
node.override['apache']['binary'] = '/usr/sbin/apache2ctl'

node.override['apache']['default_modules'] = [
  #'mod_bandwidth',
  'mod_authz_host',
  'mod_mime',
  'mod_negotiation',
  'mod_status',
  'mod_autoindex',
  'mod_dir',
  'mod_env',
  'mod_cgi',
  'mod_alias',
  'mod_rewrite',
  'mod_expires',
  'mod_headers',
  'mod_usertrack',
  'mod_unique_id',
  'mod_setenvif',
  'mod_perl',
  'mod_php5',
  'mod_proxy',
  'mod_proxy_ajp',
  'mod_proxy_balancer',
  'mod_log_config',
  'mod_include',
  'mod_deflate',
  'mod_auth_basic',
  'mod_authn_file',
  'mod_ldap',
  'mod_authnz_ldap',
  'mod_authz_user',
  'mod_authz_groupfile',
  'mod_ssl'
]

node.override['apache']['status_allow_list'] = '10.0.0.0/16 192.251.134.5/32'
node.override['apache']['ext_status'] = true

include_recipe 'apache2'

apache_conf 'other-vhosts-access-log' do
  enable true
end

apache_conf 'fen-server-status' do
  enable true
end

# Install mod_geoip
package 'libapache2-mod-geoip'
apache_module 'geoip' do
  enable true
end

# Install rotatelogs and other utilities
package 'apache2-utils'
