#
# Cookbook Name:: fen-aws
# Recipe:: default
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'fen-aws::default'

fen_aws_tag_ec2 'layer' do
  cost_center 'Learning:Reference'
end
