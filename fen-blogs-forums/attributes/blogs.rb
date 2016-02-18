#
# Cookbook Name:: fen-blogs-forums
# Attribute File:: blogs
#
# Copyright 2015, FEN
#

# Database config  
default['web_app']['blogs']['database']['name'] = 'drupal6_feblogs'
default['web_app']['blogs']['database']['user'] = 'drupal'
default['web_app']['blogs']['database']['password'] = 'dfraump3ad1'
default['web_app']['blogs']['database']['host'] = 'ip-10-0-4-111.ec2.internal'
default['web_app']['blogs']['server_name'] = 'blogs.familyeducation.com'