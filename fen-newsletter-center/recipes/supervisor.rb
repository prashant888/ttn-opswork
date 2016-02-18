#
# Cookbook Name:: fen-newsletter-center
# Recipe:: supervisor
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

log_directory = '/var/log/newsletter-center'

# Create the directory for the log files
directory log_directory do
  owner node['apache']['user']
  group node['apache']['group']
  mode '0755'
  action :create
end

supervisor_service 'fe-nlc-responsys-sync' do
  action :enable
  command "/usr/bin/php #{node['web_app']['deploy_dir']}/sites/all/libraries/fe_newsletters_sync.php"
  directory '/site/bin'
  process_name 'fe-nlc-responsys-sync_%(process_num)s'
  numprocs 3
  autostart false
  autorestart true
  startretries 100000000
  user 'www-data'
  redirect_stderr true
  stdout_logfile "#{log_directory}/fe-nlc-responsys-sync_%(process_num)s.log"
  stderr_logfile "#{log_directory}/fe-nlc-responsys-sync_%(process_num)s_error.log"
end

supervisor_service 'tv-nlc-responsys-sync' do
  action :enable
  command "/usr/bin/php #{node['web_app']['deploy_dir']}/sites/all/libraries/tv_newsletters_sync.php"
  directory '/site/bin'
  process_name 'tv-nlc-responsys-sync_%(process_num)s'
  numprocs 3
  autostart false
  autorestart true
  startretries 100000000
  user 'www-data'
  redirect_stderr true
  stdout_logfile "#{log_directory}/tv-nlc-responsys-sync_%(process_num)s.log"
  stderr_logfile "#{log_directory}/tv-nlc-responsys-sync_%(process_num)s_error.log"
end
