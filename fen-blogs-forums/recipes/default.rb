#
# Cookbook Name:: fen-blogs-forums
# Recipe:: default
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

git node['web_app']['deploy_dir'] do
  repository node['web_app']['repository']
  revision node['web_app']['branch']
  user node['apache']['user']
  group node['apache']['user']
  action :sync
  ssh_wrapper '/tmp/deploy/wrap-ssh4git.sh'
end

sites = %W{blogs forums}

sites.each do |site|
  # Create the settings.php file in for each site
  template "#{node['web_app']['deploy_dir']}/sites/#{site}.familyeducation.com/settings.php" do
    source 'settings.php.erb'
    owner node['apache']['user']
    group node['apache']['group']
    variables({
      :database_user => node['web_app']["#{site}"]['database']['user'],
      :database_pass => node['web_app']["#{site}"]['database']['password'],
      :database_host => node['web_app']["#{site}"]['database']['host'],
      :database_name => node['web_app']["#{site}"]['database']['name']  
    })
  end
  
  # Create the files directory for each site
  directory "#{node['web_app']['deploy_dir']}/sites/#{site}.familyeducation.com/files" do
    owner node['apache']['user']
    group node['apache']['group']
    mode '0755'
    action :create
  end
    
  #bash 's3cmd-get' do
  #  action :run
  #  user 'root'
  #  code <<-EOH
  #  /usr/bin/s3cmd get --force s3://fen-blogs-forums/#{site}.familyeducation.com-files.tar.gz /tmp
  #  EOH
  #end
    
  #execute 'extract_files' do
  #  command "tar xzvf /tmp/#{site}.familyeducation.com-files.tar.gz"
  #  cwd "#{node['web_app']['deploy_dir']}/sites/newsletters.#{site}.com/files"
  #  only_if { File.exists?("/tmp/nlc-#{site}-files.tar.gz") }
  #end
  
  # Set up the virtualhosts
  web_app "#{site}.familyeducation.com" do
    server_name "#{site}.familyeducation.com"
    server_aliases [node['fqdn'], "#{node['web_app']["#{site}"]['server_name'] }"]
    docroot node['web_app']['deploy_dir']
    template 'blogs-forums.conf.erb'
  end

  # Set up the VCS update cron job
  cron_d "vcs-update-cron.cron" do
    command "git -C #{node['web_app']['deploy_dir']} pull"
    cookbook 'cron'
    user node['apache']['user']
    mailto 'karl.debisschop@fen.com'
  end
  
  # Set up the Drupal cron job
  cron_d "#{site}-cron.cron" do
    minute '5'
    command "/usr/bin/wget -O - -q http://#{node['web_app']["#{site}"]['server_name']}/cron.php"
    cookbook 'cron'
    user node['apache']['user']
    mailto 'karl.debisschop@fen.com'
  end
end

# Create the primary files directory
directory "#{node['web_app']['deploy_dir']}/sites/familyeducation.com/files" do
  owner node['apache']['user']
  group node['apache']['group']
  mode '0755'
  action :create
end

# Fetch the files from s3
#bash 's3cmd-get' do
#  action :run
#  user 'root'
#  code <<-EOH
#  /usr/bin/s3cmd get --force s3://fen-blogs-forums/familyeducation.com-files.tar.gz /tmp
#  EOH
#end
#
#execute 'extract_files' do
#  command "tar xzvf /tmp/familyeducation.com-files.tar.gz"
#  cwd "#{node['web_app']['deploy_dir']}/sites/familyeducation.com/files"
#  only_if { File.exists?("/tmp/familyeducation.com-files.tar.gz") }
#end

# Install drush via git
node.default['drush']['install_method'] = 'git'
node.default['drush']['version'] = '6.7.0'
include_recipe 'drush'

#log 'complete' do
#  message 'Blogs and Forums setup is complete'
#  notifies :restart, 'service[apache2]', :immediately
#end