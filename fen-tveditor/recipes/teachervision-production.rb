#
# Cookbook Name:: fen-tveditor
# Recipe:: teachervision-production
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute

include_recipe 'fen-site-deploy::site-on-ebs'
include_recipe 'fen-tveditor::teachervision'
