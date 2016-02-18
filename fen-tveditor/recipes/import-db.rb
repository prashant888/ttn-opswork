#
# Cookbook Name:: fen-tveditor
# Recipe:: import-database
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

#           List of databases
# Name    |    Owner    | Encoding
# -----------+-------------+-----------
# biobase   | kdebisschop | UTF8
# botr      | tchatter    | SQL_ASCII
# centipede | dfranklin   | UTF8
# chemgloss | kdebisschop | UTF8
# events    | postgres    | SQL_ASCII
# feature   | kdebisschop | UTF8
# geobase   | postgres    | SQL_ASCII
# horoscope | postgres    | SQL_ASCII
# id        | postgres    | SQL_ASCII
# malaysia  | kdebisschop | UTF8
# movies    | kdebisschop | UTF8
# names     | kdebisschop | UTF8
# news      | kdebisschop | UTF8
# partner   | postgres    | SQL_ASCII
# poll      | dfranklin   | SQL_ASCII
# postgres  | postgres    | UTF8
# recalls   | kdebisschop | UTF8
# regdb     | postgres    | SQL_ASCII
# rss       | vathaan     | LATIN1
# scores    | kdebisschop | UTF8
# status    | postgres    | SQL_ASCII
# sudoku    | kdebisschop | UTF8
# syndb     | kdebisschop | UTF8
# template0 | postgres    | UTF8
# template1 | postgres    | UTF8
# tv        | ujosebe     | SQL_ASCII
# tvusers   | dfranklin   | SQL_ASCII
# undergrad | kdebisschop | UTF8
#
#

require 'chef/log'

include_recipe 'database::postgresql'

log 'starting' do
  message 'starting Postgresql database restore'
  notifies :stop, 'service[postgresql]', :immediately
  notifies :start, 'service[postgresql]', :immediately
end

# Create the directory for copying the database dumps from s3
directory '/tmp/db_dumps' do
  action :create
end

postgresql_connection_info = {
  :host      => '127.0.0.1',
  :port      => 5432,
  :username  => 'postgres',
  :password  => node['postgresql']['password']['postgres']
}

%w(webadmin).each do |db_user|
  postgresql_database_user db_user do
    Chef::Log.info("FEN :: Creating #{db_user} user in postgresql")
    action :create
    connection postgresql_connection_info
    superuser false
    createdb false
    login true
    replication false
    password 'www'
  end
end

# Iterate through the list of dump files, and import each database
# Dir.glob('/tmp/db_dumps/*.dump').each do |db_dump|
db_list = %w(biobase feature id)
db_list.each do |db_name|
  # Fetch the database backup
  bash 's3cmd-get' do
    Chef::Log.info("FEN :: Fetching the database dump from s3")
    action :run
    user 'root'
    code <<-EOH
    /usr/bin/s3cmd get --force s3://fe-tv-database-backups/#{db_name}.dump.gz /tmp/db_dumps
    EOH
  end

    # db_name = File.basename(db_dump, '.dump')
  db_dump = "/tmp/db_dumps/#{db_name}.dump.gz"
      
  Chef::Log.info("FEN :: Creating the #{db_name} database in postgresql")

  # Create the database
  postgresql_database db_name do
    connection postgresql_connection_info
    owner 'webadmin'
    encoding 'UTF-8'
  end

  # grant all privileges on database
  postgresql_database_user 'webadmin' do
    Chef::Log.info("FEN :: Granting privileges to webadmin user in postgresql for database #{db_name}")
    connection postgresql_connection_info
    database_name db_name
    privileges [:all]
    action :grant
  end

  # grant all privileges on schema
  postgresql_database_user 'webadmin' do
    Chef::Log.info("FEN :: Granting privileges to webadmin user in postgresql for database #{db_name}")
    connection postgresql_connection_info
    schema_name 'public'
    privileges [:all]
    action :grant
  end

  Chef::Log.info("FEN :: Loading database dump #{db_dump} into #{db_name}")
  execute 'restore_backup' do
    # no owner, no password, clean first, 4 jobs, custom format
    command "zcat #{db_dump} | /usr/bin/psql -U webadmin #{db_name}"
  end

  # What we want is this:
  #   GRANT ALL ON ALL TABLES IN SCHEMA public TO webadmin;
  #   GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO webadmin;
end
