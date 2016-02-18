#
# Cookbook Name:: fen-blogs-forums
# Attribute File:: default
#
# Copyright 2015, FEN
#

default['web_app']['repository'] = 'ssh://git@vc.fen.com/fe-social'
default['web_app']['branch'] = 'maint'
default['web_app']['deploy_dir'] = '/var/www/html/fe-social'
  
# PHP config
default['web_app']['php']['memory_limit'] = '128M'  
 