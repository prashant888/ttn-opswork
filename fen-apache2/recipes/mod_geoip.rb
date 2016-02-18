#
# Cookbook Name:: fen-apache2
# Recipe:: mod_geoip2
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

# Install the mod_geoip apache module
package 'libapache2-mod-geoip'

apache_module 'geoip' do
  enable true
end
