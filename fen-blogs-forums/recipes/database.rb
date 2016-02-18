#
# Cookbook Name:: fen-blogs-forums
# Recipe:: database
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

# Restart mysql
execute 'restart mysql' do
  action :run
  command <<-EOF
  service mysql restart
  EOF
end

sites = %w[blogs forums members]
  
sites.each do |sitename|

  database_name =  node['web_app']["#{sitename}"]['database']['name']
    
  # Create the database if it doesn't exist
  execute 'create_database' do
    action :run
    command <<-EOF
    /usr/bin/mysql -u root -e "CREATE DATABASE IF NOT EXISTS #{database_name}"
    EOF
  end
  
  # Create the user and grant permissions
  execute 'create_user_grant' do
    action :run
    command <<-EOF
    /usr/bin/mysql -u root -e "GRANT ALL ON #{database_name}.* to '#{node['web_app']["#{sitename}"]['database']['user']}'@'%' IDENTIFIED BY '#{node['web_app']["#{sitename}"]['database']['password']}'"
    EOF
  end
  
  # Delete the file if it exists
  file "/tmp/#{database_name}.dump.gz" do
    action :delete
  end
  
  file "/tmp/#{database_name}.dump" do
    action :delete
  end
  
  # Fetch the database backup
  bash 's3cmd-get' do
    action :run
    user 'root'
    code <<-EOH
    /usr/bin/s3cmd get --force s3://fen-blogs-forums/#{database_name}.dump.gz /tmp
    EOH
  end
    
  # Unpack the backup
  execute 'extract_files' do
    command "gunzip /tmp/#{database_name}.dump.gz"
    cwd '/tmp'
    only_if { File.exists?("/tmp/#{database_name}.dump.gz") }
  end
  
  # Load the backup
  execute 'restore_backup' do
    cwd '/tmp'
    command "mysql #{database_name} < #{database_name}.dump"
    only_if { File.exists?("/tmp/#{database_name}.dump") }
  end 
end