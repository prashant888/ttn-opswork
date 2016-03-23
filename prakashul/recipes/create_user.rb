# Cookbook Name:: fen-cloud-watch-script
# Recipe:: cloud-watch-cron
#
# Copyright 2016, Sandbox Networks, Inc.
#
# All rights reserved - Do Not Redistribute
#

user 'monitor' do
  comment 'Only for cron services'
  action :create
  home '/home/monitor'
  shell '/bin/bash'
end


cookbook_file '/home/monitor/create_ami.sh' do
  source 'create_ami.sh'
  owner 'monitor'
  group 'opsworks'
  mode '0755'
  action :create
end

cookbook_file '/home/monitor/learning-cms-assets-code-deployment.sh' do
  source 'learning-cms-assets-code-deployment.sh'
  owner 'monitor'
  group 'opsworks'
  mode '0755'
  action :create
end

env = { AWS_DEFAULT_REGION: 'us-east-1' }
exepath = '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/bin/aws'
  
cron_d "create_ami" do
  comment 'Create AMI'
  user 'monitor'
  environment env
  path exepath
  minute '10'
  hour	 '10'
  command '/bin/bash /home/monitor/create_ami.sh >> /var/log/cron.log 2>&1'
  mailto 'prakashul@tothenew.com'
end

cron_d "Push to GIT" do
  comment 'Pushing to GIT'
  user 'monitor'
  environment env
  path exepath
  minute '*/10'
  command '/bin/bash /home/monitor/learning-cms-assets-code-deployment.sh >> /var/log/cron.log 2>&1'
  mailto 'prakashul@tothenew.com'
end
