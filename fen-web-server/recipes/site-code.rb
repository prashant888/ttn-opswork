#
# Cookbook Name:: fen-web-server
# Recipe:: library-code
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

require 'chef/log'

# Fetch the tv site cache backup from s3
bash 's3cmd-get' do
  action :run
  user 'root'
  code <<-EOH
  /usr/bin/s3cmd get --force s3://fen-site-cache/tv-cache.tar.gz /tmp
  EOH
end
  
execute 'extract_files' do
  command "tar xzvf /tmp/tv-cache.tar.gz"
  cwd node['code']['html']['cache_dir']
  only_if { File.exists?("/tmp/tv-cache.tar.gz") }
end

# Define a log file for the s3cmd output
results = "/tmp/s3cmd-output.txt"

# Delete the file if it exists
file results do
    action :delete
end

Chef::Log.debug("Copying site-lib from /mnt/staging to #{node['code']['library']['deploy_dir']}")

# Copy the lib directory from the nfs mount
#bash 'staging copy' do
#  action :run
#  user 'root'
#  code <<-EOH
#  /bin/cp -r /mnt/staging/site/lib/* #{node['code']['library']['deploy_dir']} &> #{results}
#  EOH
#end

if Dir.glob("#{node['code']['library']['deploy_dir']}/{*,.*}").empty?
  # Get all the files from s3
  bash 's3cmd-get' do
    action :run
    user 'root'
    code <<-EOH
    /usr/bin/s3cmd get -r --force s3://site-lib #{node['code']['library']['deploy_dir']} &> #{results}
    EOH
  end
else
  # Sync all the files from s3
  bash 's3cmd-get' do
    action :run
    user 'root'
    code <<-EOH
    /usr/bin/s3cmd sync s3://site-lib #{node['code']['library']['deploy_dir']} &> #{results}
    EOH
  end
end

if Dir.glob("#{node['code']['html']['deploy_dir']}/{*,.*}").empty?
  # Get all the files from s3
  bash 's3cmd-get' do
    action :run
    user 'root'
    code <<-EOH
    /usr/bin/s3cmd get -r --force s3://site-html-familyeducation #{node['code']['html']['deploy_dir']} &> #{results}
    EOH
  end
else
  # Sync all the files from s3
  bash 's3cmd-get' do
    action :run
    user 'root'
    code <<-EOH
    /usr/bin/s3cmd sync s3://site-html-familyeducation #{node['code']['html']['deploy_dir']} &> #{results}
    EOH
  end
end


# Fix the ownership
directory node['code']['base_dir'] do
  owner node['apache']['user']
  group node['apache']['user']
  recursive true
end

Chef::Log.debug("Syncing from s3 is complete")