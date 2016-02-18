#
# Cookbook Name:: fen-mail-relay
# Attribute File:: default
#
# Copyright 2015, FEN
#

default['fen']['session']['store'] = 'fen.com'
default['postfix']['main']['myorigin'] = 'fen.com'
