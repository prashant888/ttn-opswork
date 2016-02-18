#
# Cookbook Name:: fen-blogs-forums
# Attribute File:: forums
#
# Copyright 2015, FEN
#

# Database config  
default['web_app']['forums']['database']['name'] = 'drupal6_feforums'
default['web_app']['forums']['database']['user'] = 'drupal'
default['web_app']['forums']['database']['password'] = 'dfraump3ad1'
default['web_app']['forums']['database']['host'] = 'ip-10-0-4-111.ec2.internal'
default['web_app']['forums']['server_name'] = 'forums.familyeducation.com'