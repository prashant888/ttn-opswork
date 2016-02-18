#
# Cookbook Name:: fen-build-farm
# Recipe:: credentials
#
# Copyright 2015, Family Education Network
#
# All rights reserved - Do Not Redistribute
#

credentials = search('jenkins').first
node.run_state[:jenkins_private_key] = credentials['private_key']
node.run_state[:jenkins_username] = 'karl.debisschop@fen.com'

jenkins_password_credentials 'svnsync' do
  id '8e98822e-7ebd-4946-b136-5dd68a8d3247'
  description 'svnsync'
  password    'nsevo5whI@7E'
end