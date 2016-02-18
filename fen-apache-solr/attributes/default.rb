#
# Cookbook Name:: fen-apache-solr
# Attributes:: default
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

default['apache']['solr']['config_base_dir'] = '/var/lib/tomcat7/solr'
default['apache']['solr']['data_dir'] = '/var/fen/solr/index/fen'
default['apache']['solr']['cores'] = %w[fen whatworks.com babynames.familyeducation.com]