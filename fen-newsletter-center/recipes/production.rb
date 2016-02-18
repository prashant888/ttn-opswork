#
# Cookbook Name:: fen-newsletter-center
# Recipe:: production
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

node.override['web_app']['branch'] = 'master'
  
include_recipe 'fen-newsletter-center'