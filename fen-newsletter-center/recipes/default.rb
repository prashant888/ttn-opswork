#
# Cookbook Name:: fen-newsletter-center
# Recipe:: default
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

node.normal['php']['include_path'] = %w[. /site/lib]
include_recipe 'fen-php'
 
git node['web_app']['deploy_dir'] do
  repository node['web_app']['repository']
  revision node['web_app']['branch']
  user node['apache']['user']
  group node['apache']['user']
  action :sync
  ssh_wrapper '/tmp/deploy/wrap-ssh4git.sh'
end

  
sites = %w{teachervision familyeducation}

sites.each do |site|
  # Create the settings.php file in for each site
  template "#{node['web_app']['deploy_dir']}/sites/newsletters.#{site}.com/settings.php" do
    source 'settings.php.erb'
    owner node['apache']['user']
    group node['apache']['group']
    mode '0755'
    variables({
      :database_config => node['web_app']["#{site}"]['database'],
      :rabbitmq_prefix => node['web_app']["#{site}"]['rabbitmq_prefix'],
      :server_name => node['web_app']["#{site}"]['server_name'] 
    })
  end
  
  # Create the files directory for each site
  directory "#{node['web_app']['deploy_dir']}/sites/newsletters.#{site}.com/files" do
    owner node['apache']['user']
    group node['apache']['group']
    mode '0755'
    action :create
  end
    
  bash 's3cmd-get' do
    action :run
    user 'root'
    code <<-EOH
    /usr/bin/s3cmd get --force s3://fen-nlc-backups/nlc-#{site}-files.tar.gz /tmp
    EOH
  end
    
  execute 'extract_files' do
    command "tar xzvf /tmp/nlc-#{site}-files.tar.gz"
    cwd "#{node['web_app']['deploy_dir']}/sites/newsletters.#{site}.com"
    only_if { File.exists?("/tmp/nlc-#{site}-files.tar.gz") }
  end
  
  # Set up a custom default vhost that redirects access to anything that doesn't match our NLC domains
  web_app 'newsletters-default' do
    template 'newsletters-default.conf.erb'
  end

  # Set up the virtualhosts
  web_app "newsletters.#{site}.com" do
    server_name "newsletters.#{site}.com"
    server_aliases [
      node['fqdn'], 
      "#{node['web_app']["#{site}"]['server_name'] }",
      "dev.#{node['web_app']["#{site}"]['server_name'] }",
      "cert.#{node['web_app']["#{site}"]['server_name'] }"
    ]
    docroot node['web_app']['deploy_dir']
    template 'newsletters.conf.erb'
  end
  
  cron_key = node['web_app']["#{site}"]['drupal_cron_key']
    
  # Set up the Drupal cron job
  cron_d "newsletters-#{site}.cron" do
    minute '5'
    command "/usr/bin/wget -O - -q http://#{node['web_app']["#{site}"]['server_name']}/cron.php?cron_key=#{cron_key}"
    cookbook 'cron'
    user node['apache']['user']
    mailto 'erich.beyrent@fen.com'
  end
end

# Create the default files directory
directory "#{node['web_app']['deploy_dir']}/sites/default/files" do
  owner node['apache']['user']
  group node['apache']['group']
  mode '0755'
  action :create
end
  
bash 's3cmd-get' do
  action :run
  user 'root'
  code <<-EOH
  /usr/bin/s3cmd get --force s3://fen-nlc-backups/nlc-default-files.tar.gz /tmp
  EOH
end
  
execute 'extract_files' do
  command "tar xzvf /tmp/nlc-default-files.tar.gz"
  cwd "#{node['web_app']['deploy_dir']}/sites/default"
  only_if { File.exists?("/tmp/nlc-default-files.tar.gz") }
end

# Install drush via git
node.default['drush']['install_method'] = 'git'
node.default['drush']['version'] = '6.7.0'
include_recipe 'drush'

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

log 'complete' do
  message 'Newsletter Center setup is complete'
  notifies :restart, 'service[apache2]', :immediately
end
