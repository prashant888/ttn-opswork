#
# Cookbook Name:: fen-site-deploy
# Recipe:: production-poptropica
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

node.override['fen']['site']['sitegroup'] = 'poptropica'

include_recipe 'fen-site-deploy::default'