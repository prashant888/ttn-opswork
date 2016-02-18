#
# Cookbook Name:: fen-apache-solr
# Recipe:: default
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'fen-ssl::fen'

# Install Java 7
node.default['java']['jdk_version'] = '7'
include_recipe 'java'

# Install Tomcat 7
node.default['tomcat']['base_version'] = 7
node.default['tomcat']['user'] = 'tomcat7'
node.default['tomcat']['group'] = 'tomcat7'
node.default["tomcat"]["deploy_manager_apps"] = true

node.default['tomcat']['ssl_cert_file'] = "#{node['fen-ssl']['ssl_cert_dir']}/star.fen.com.crt"
node.default['tomcat']['ssl_key_file'] = "#{node['fen-ssl']['ssl_key_dir']}/star.fen.com.key"
node.default['tomcat']['ssl_chain_files'] = ["#{node['fen-ssl']['ssl_cert_dir']}/csc_bundle.crt"]
node.default['tomcat']['certificate_dn'] = "O=Server,CN=#{node['hostname']}.fen.com"

include_recipe 'tomcat'

# Install the WAR file
cookbook_file '/var/lib/tomcat7/webapps/solr.war' do
  source 'solr.war'
  owner 'root'
  group 'root'
  mode '0644'
  #notifies :restart, 'service[tomcat7]', :delayed
end

# Create the Solr data directory which holds the indexes
directory node['apache']['solr']['data_dir'] do
  recursive true
  action :create
  owner node['tomcat']['user']
  group node['tomcat']['group']
  mode '0755'
  not_if { File.exists?(node['apache']['solr']['data_dir']) }
end

# Delete the file if it exists
file '/tmp/solr.tar.gz' do
  action :delete
end

# Fetch the Solr backup
bash 's3cmd-get' do
  action :run
  user 'root'
  code <<-EOH
  /usr/bin/s3cmd get --force s3://fen-apache-solr/solr.tar.gz /tmp
  EOH
end
  
# Unpack the backup
execute 'extract_files' do
  action :run
  user 'root'
  cwd '/tmp'
  command 'tar -zxvf /tmp/solr.tar.gz'
  only_if { File.exists?('/tmp/solr.tar.gz') }
end

execute "chown solr" do
  command "chown -R tomcat7:tomcat7 /tmp/solr"
  only_if { File.exists?('/tmp/solr') }
end

execute 'copy solr' do
  command 'cp -R /tmp/solr /var/lib/tomcat7'
  only_if { File.exists?('/tmp/solr') }
end

template "#{node['apache']['solr']['config_base_dir']}/conf/solrconfig.xml" do
    source 'solrconfig.xml.erb'
    owner node['tomcat']['user']
    group node['tomcat']['group']
    mode '0755'
  end
  
node['apache']['solr']['cores'].each do |core|
  template "#{node['apache']['solr']['config_base_dir']}/#{core}/conf/solrconfig.xml" do
    source 'solrconfig.xml.erb'
    owner node['tomcat']['user']
    group node['tomcat']['group']
    mode '0755'
  end
end

# Restart tomcat
ruby_block 'restart tomcat' do
  action :nothing
  block do
    resources('service[tomcat7]').run_action(:restart)
  end
end
