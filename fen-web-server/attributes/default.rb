#
# Cookbook Name:: fen-web-server
# Attributes:: default
#

default['code']['base_dir'] = '/site'
default['code']['library']['deploy_dir'] = "#{node['code']['base_dir']}/lib"
default['code']['script']['deploy_dir'] = "#{node['code']['base_dir']}/bin"
default['code']['html']['deploy_dir'] = "#{node['code']['base_dir']}/html/famed"
default['code']['html']['cache_dir'] = "#{node['code']['base_dir']}/cache"
default['web_app']['base_deploy_dir'] = '/var/www/html'

default['php']['directives']['date.timezone'] = 'UTC'
