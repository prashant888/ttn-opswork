# Cookbook Name:: fen-s3cmd
# Resource:: fen-s3cmd
#
# Copyright 2015, FEN
#


actions :get
default_action :get


# bucket            'site-lib'
#owner             node['apache']['user']
#group             node['apache']['user']
#mode              '0755'
#recursive         true
#region            'us-east-1'

attribute :deploy_root, :kind_of => String
attribute :recursive, :kind_of => [TrueClass, FalseClass], :default => true
attribute :bucket, :kind_of => String
attribute :files, :kind_of => Array, :default => []
attribute :owner, :kind_of => String
attribute :group, :kind_of => String
attribute :mode, :kind_of => String, :default => '0755'



