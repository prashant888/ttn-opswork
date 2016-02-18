#
# Cookbook Name:: fen-tveditor
# Attributes:: dailyteach
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

default['fen-tveditor']['dailyteach']['server_name'] = 'dailyteach.teachervision.com'
default['fen-tveditor']['dailyteach']['server-aliases'] = %w[
  dev-dailyteach.teachervision.com
  cert-dailyteach.teachervision.com
  aws-dailyteach.teachervision.com
  stage-dailyteach.teachervision.com 
  redesign-dailyteach.teachervision.com
  dev.dailyteach.teachervision.com
  cert.dailyteach.teachervision.com
  aws.dailyteach.teachervision.com
  stage.dailyteach.teachervision.com 
  redesign.dailyteach.teachervision.com
  dailyteach.dev.teachervision.com
  dailyteach.cert.teachervision.com
  dailyteach.aws.teachervision.com
  dailyteach.stage.teachervision.com 
  dailyteach.redesign.teachervision.com
  dailyteach-dev.teachervision.com
  dailyteach-cert.teachervision.com
  dailyteach-aws.teachervision.com
  dailyteach-stage.teachervision.com 
  dailyteach-redesign.teachervision.com
]