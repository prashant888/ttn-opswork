#
# Cookbook Name:: fen-database-server
# Recipe:: redmine
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

node.default['percona']['server']['role'] = 'master'
node.default['percona']['main_config_file'] = '/etc/mysql/my.cnf'
node.default['percona']['skip_passwords'] = true
  
# Fine Tuning
node.default['percona']['server']['key_buffer_size'] = '208M'
node.default['percona']['server']['max_allowed_packet'] = '1024M'
node.default['percona']['server']['join_buffer_size'] = '128M'
node.default['percona']['server']['thread_cache_size'] = 120
node.default['percona']['server']['max_connections'] = 110
node.default['percona']['server']['sql_modes'] = ['NO_ENGINE_SUBSTITUTION', 'TRADITIONAL']
node.default['percona']['server']['wait_timeout'] = 14_400
node.default['percona']['server']['interactive_timeout'] = 14_400

# Query Cache Configuration
node.default['percona']['server']['query_cache_size'] = '150M'
node.default['percona']['server']['query_cache_limit'] = '256M'

# Logging and Replication
node.default['percona']['server']['long_query_time'] = 2
node.default['percona']['server']['log-queries-not-using-indexes'] = true
node.default['percona']['server']['log_slow_admin_statements'] = true
node.default['percona']['server']['log_slow_verbosity'] = 'query_plan'

# InnoDB Specific
node.default['percona']['server']['innodb_buffer_pool_size'] = '8192M'
node.default['percona']['server']['innodb_flush_log_at_trx_commit'] = 2
node.default['percona']['server']['innodb_log_file_size'] = '100M'
node.default['percona']['server']['innodb_thread_concurrency'] = 8
  

# Declare included recipes
include_recipe 'percona'
include_recipe 'percona::server'
include_recipe 'percona::toolkit'