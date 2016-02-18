#
# Cookbook Name:: poptropica
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "fen-apache2"
include_recipe "fen-php"
include_recipe "percona::client"
include_recipe "percona::toolkit"

web_app 'poptropica' do
    template 'poptropica.conf.erb'
end
