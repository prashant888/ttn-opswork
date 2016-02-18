#
# Cookbook Name:: fen-site-deploy
# Recipe:: production-familyeducation
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

node.override['fen']['site']['sitegroup'] = 'familyeducation'

include_recipe 'fen-site-deploy::default'
