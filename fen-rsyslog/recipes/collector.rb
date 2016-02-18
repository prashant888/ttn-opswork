node.default['rsyslog']['log_dir'] = '/vol/syslog'
 
include_recipe 'rsyslog::server'