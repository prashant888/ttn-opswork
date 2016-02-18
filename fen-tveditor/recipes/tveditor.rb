#
# Cookbook Name:: fen-tveditor
# Recipe:: tveditor
#
# Simple wrapper to include TV Editor for both FE and TV platforms
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'fen-tveditor::tveditor-fe'
include_recipe 'fen-tveditor::tveditor-tv'
