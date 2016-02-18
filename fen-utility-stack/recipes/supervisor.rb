#
# Cookbook Name:: fen-utility-stack
# Recipe:: supervisor
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

log_directory = '/var/log/responsys'

# Create the directory for the log files
directory log_directory do
  owner node['apache']['user']
  group node['apache']['group']
  mode '0755'
  action :create
end

supervisor_service 'pop-entitlement-sync' do
  action :enable
  command "/usr/bin/php -d auto_prepend_file=/site/cfg/prepend-tv.php /site/bin/pop-process-entitlement.php"
  directory '/site/bin'
  process_name 'pop-entitlement-sync_%(process_num)s'
  numprocs 3
  autostart true
  autorestart true
  startretries 100000000
  user 'www-data'
  stdout_logfile "syslog"
  stderr_logfile "syslog"
end

supervisor_service 'tv-entitlement-sync' do
  action :enable
  command "/usr/bin/php -d auto_prepend_file=/site/cfg/prepend-tv.php -d auto_prepend_file=/site/cfg/prepend-tv.php /site/bin/tv-process-entitlement.php"
  directory '/site/bin'
  process_name 'tv-entitlement-sync_%(process_num)s'
  numprocs 2
  autostart true
  autorestart true
  startretries 100000000
  user 'www-data'
  stdout_logfile "syslog"
  stderr_logfile "syslog"
end

supervisor_service 'responsys_process_ced_event_fe_nlc' do
  action :enable
  command "/usr/bin/php -d auto_prepend_file=/site/cfg/prepend-tv.php /site/bin/responsys/responsys_process_ced_event.php --routingkey responsys-ced-fe-nlc
  directory=/site/bin/responsys"
  directory '/site/bin'
  process_name 'responsys_process_ced_event_fe_nlc_%(process_num)s'
  numprocs 1
  autostart true
  autorestart true
  startretries 100000000
  user 'root'
  redirect_stderr true
  stdout_logfile "#{log_directory}/responsys_process_ced_event_fe_nlc_%(process_num)s.log"
  stderr_logfile "#{log_directory}/responsys_process_ced_event_fe_nlc_%(process_num)s_error.log"
end

supervisor_service 'responsys_process_ced_event_tv_nlc' do
  action :enable
  command "/usr/bin/php -d auto_prepend_file=/site/cfg/prepend-tv.php /site/bin/responsys/responsys_process_ced_event.php --routingkey responsys-ced-tv-nlc"
  directory '/site/bin/responsys'
  process_name 'responsys_process_ced_event_tv_nlc_%(process_num)s'
  numprocs 1
  autostart true
  autorestart true
  startretries 100000000
  user 'root'
  redirect_stderr true
  stdout_logfile "#{log_directory}/responsys_process_ced_event_tv_nlc_%(process_num)s.log"
  stderr_logfile "#{log_directory}/responsys_process_ced_event_tv_nlc_%(process_num)s_error.log"
end

supervisor_service 'responsys_process_ced_event_poptropica_live' do
  action :enable
  command "/usr/bin/php -d auto_prepend_file=/site/cfg/prepend-tv.php /site/bin/responsys/responsys_process_ced_event.php --routingkey responsys-ced-live-poptropica"
  directory '/site/bin/responsys'
  process_name 'responsys_process_ced_event_poptropica_live_%(process_num)s'
  numprocs 1
  autostart true
  autorestart true
  startretries 100000000
  user 'root'
  redirect_stderr true
  stdout_logfile "#{log_directory}/responsys_process_ced_event_poptropica_live_%(process_num)s.log"
  stderr_logfile "#{log_directory}/responsys_process_ced_event_poptropica_live_%(process_num)s_error.log"
end

supervisor_service 'responsys_process_ced_event_poptropica_dev' do
  action :enable
  command "/usr/bin/php -d auto_prepend_file=/site/cfg/prepend-tv.php /site/bin/responsys/responsys_process_ced_event.php --routingkey responsys-ced-dev-poptropica"
  directory '/site/bin/responsys'
  process_name 'responsys_process_ced_event_poptropica_dev_%(process_num)s'
  numprocs 1
  autostart true
  autorestart true
  startretries 100000000
  user 'root'
  redirect_stderr true
  stdout_logfile "#{log_directory}/responsys_process_ced_event_poptropica_dev_%(process_num)s.log"
  stderr_logfile "#{log_directory}/responsys_process_ced_event_poptropica_dev_%(process_num)s_error.log"
end

supervisor_service 'responsys_process_ced_event_tv_live' do
  action :enable
  command "/usr/bin/php -d auto_prepend_file=/site/cfg/prepend-tv.php /site/bin/responsys/responsys_process_ced_event.php --routingkey responsys-ced-live-tv"
  directory '/site/bin/responsys'
  process_name 'responsys_process_ced_event_tv_live_%(process_num)s'
  numprocs 1
  autostart true
  autorestart true
  startretries 100000000
  user 'root'
  redirect_stderr true
  stdout_logfile "#{log_directory}/responsys_process_ced_event_tv_live_%(process_num)s.log"
  stderr_logfile "#{log_directory}/responsys_process_ced_event_tv_live_%(process_num)s_error.log"
end

supervisor_service 'responsys_process_ced_event_tv_dev' do
  action :enable
  command "/usr/bin/php -d auto_prepend_file=/site/cfg/prepend-tv.php /site/bin/responsys/responsys_process_ced_event.php --routingkey responsys-ced-dev-tv"
  directory '/site/bin/responsys'
  process_name 'responsys_process_ced_event_tv_dev_%(process_num)s'
  numprocs 1
  autostart true
  autorestart true
  startretries 100000000
  user 'root'
  redirect_stderr true
  stdout_logfile "#{log_directory}/responsys_process_ced_event_tv_dev_%(process_num)s.log"
  stderr_logfile "#{log_directory}/responsys_process_ced_event_tv_dev_%(process_num)s_error.log"
end

