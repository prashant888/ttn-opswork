#
# Cookbook Name:: fen-build-farm
# Recipe:: jobs
#
# Copyright 2015, Family Education Network
#
# All rights reserved - Do Not Redistribute
#

credentials = search('jenkins').first
node.run_state[:jenkins_private_key] = credentials['private_key']
node.run_state[:jenkins_username] = 'karl.debisschop@fen.com'

xml = File.join(Chef::Config[:file_cache_path], )

job_configs = %w(vendor.xml poptropicore.xml)

job_configs.each do |config_file|
  # copy the configuration
  cookbook_file "#{xml}/#{config_file}" do
    source "jobs/#{config_file}"
  end

  # create the job
  jenkins_job File.basename(config_file, '.xml') do
    config "#{xml}/#{config_file}"
  end
end
