#
# Cookbook Name:: fen-mail-relay
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'fen-base-server'

include_recipe 'mongodb'

include_recipe 'fen-ssl::fen'

node.default['openldap']['ssl_cert'] = 'star.fen.com.crt'
node.default['openldap']['cafile'] = 'csc_bundle.crt'
node.default['openldap']['ssl_key'] = 'star.fen.com.key'

node.default['openldap']['basedn'] = 'dc=fen,dc=com'
node.default['openldap']['cn'] = 'admin'
node.default['openldap']['server'] = 'ldap01.fen.com'
node.default['openldap']['tls_enabled'] = false

node.default['openldap']['manage_ssl'] = false

node.default['openldap']['rootpw'] = '912w7P2oLoFo2'

include_recipe 'openldap::server'
