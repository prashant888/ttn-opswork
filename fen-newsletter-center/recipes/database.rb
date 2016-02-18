#
# Cookbook Name:: fen-newsletter-center
# Recipe:: database
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

require 'chef/log'
# Chef::Log.debug('Stopping Percona')
  
# Restart mysql
execute 'restart mysql' do
  action :run
  command <<-EOF
  service mysql restart
  EOF
end
  
sites = {
  'fe' => 'familyeducation',
  'tv' => 'teachervision'
}

sites.each_pair do |site,sitename|
  database = node['web_app'][sitename]['database']['name']

  not_if  "mysql -u root -D #{database} -e 'show tables'"
  
  # Create the database if it doesn't exist
  execute 'create_database' do
    action :run
    command <<-EOF
    /usr/bin/mysql -u root -e "CREATE DATABASE IF NOT EXISTS #{database}"
    EOF
  end
  
  # Create the user and grant permissions
  db_user = node['web_app'][sitename]['database']['user']
  db_password = node['web_app'][sitename]['database']['password']
  execute 'create_user_grant' do
    action :run
    command <<-EOF
    /usr/bin/mysql -u root -e "GRANT ALL ON #{database}.* to '#{db_user}'@'%' IDENTIFIED BY '#{db_password}'"
    EOF
  end
  
  # Delete the file if it exists
  file "/tmp/#{database}.dump.gz" do
    action :delete
  end
  
  file "/tmp/#{database}.dump" do
    action :delete
  end
  
  # Fetch the database backup
  bash 's3cmd-get' do
    action :run
    user 'root'
    code <<-EOH
    /usr/bin/s3cmd get --force s3://fen-nlc-backups/#{database}.dump.gz /tmp
    EOH
  end
    
  # Load the backup
  execute 'restore_backup' do
    user 'root'
    cwd '/tmp'
    retries 2
    #ignore_failure true
    command "zcat #{database}-1.dump.gz | mysql #{database}"
    not_if  "mysql -u root -D #{database} -e 'show tables'"
    only_if { File.exists?("/tmp/#{database}.dump.gz") }
  end 
end
