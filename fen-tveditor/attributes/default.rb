#
# Cookbook Name:: fen-tveditor
# Attributes:: default
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

default['fen']['sitevars']['global']['DEV'] = 0
default['fen']['sitevars']['global']['IMAGE_HOST'] = 'i.infopls.com'
 
default['fen-tveditor']['deploy_dir'] = '/site/html'
  
default['fen-tveditor']['server_name'] = 'www.teachervision.com'
default['fen-tveditor']['server-aliases'] = %w[
  dev.teachervision.com
  cert.teachervision.com
  aws.teachervision.com
  stage.teachervision.com 
  redesign.teachervision.com
]