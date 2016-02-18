#
# Cookbook Name:: fen-site-deploy
# Recipe:: production-teachervision
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

node.override['fen']['site']['sitegroup'] = 'teachervision'

include_recipe 'fen-site-deploy::production'
