#
# Cookbook Name:: fen-database-server
# Recipe:: tveditor
#

node.default['postgresql']['enable_pgdg_apt'] = true

node.override['postgresql']['version'] = '9.3'
node.override['postgresql']['pg_hba'] = [
  {
    'type' => 'local', 
    'db' => 'all', 
    'user' => 'all', 
    'addr' => nil, 
    'method' => 'trust'
  },
  {
    'type' => 'host', 
    'db' => 'all', 
    'user' => 'all', 
    'addr' => '127.0.0.1/32', 
    'method' => 'trust'
  },
  {
    'type' => 'host', 
    'db' => 'all', 
    'user' => 'all', 
    'addr' => '10.0.0.0/16', 
    'method' => 'trust'
  },
  {
    'type' => 'host', 
    'db' => 'all', 
    'user' => 'all', 
    'addr' => '::1/128', 
    'method' => 'trust',
  }
]

node.default['postgresql']['config']['listen_addresses'] = '*'
node.default['postgresql']['config']['max_connections'] = 500
  
node.default['postgresql']['assign_postgres_password'] = false

include_recipe 'postgresql::server'

node.default['postgresql']['contrib']['packages'] = [
    "postgresql-contrib-#{node['postgresql']['version']}",
    "postgresql-plperl-#{node['postgresql']['version']}",
    "postgresql-pltcl-#{node['postgresql']['version']}"
]
node.default['postgresql']['contrib']['extensions'] =
    %w(pageinspect pg_buffercache pg_freespacemap pgrowlocks pg_stat_statements pgstattuple plperl pltcl)
include_recipe 'postgresql::contrib'

