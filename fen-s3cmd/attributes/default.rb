#
# Cookbook Name:: fen-s3cmd
# Attributes:: default
#

default['s3cmd']['users'] = %w[root]
default['s3cmd']['access_key_id'] = ''
default['s3cmd']['secret_access_key'] = ''
default['s3cmd']['use_https'] = 'True'