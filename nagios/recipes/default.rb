#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
hostname = search("aws_opsworks_instance").each do |hostname| 
Chef::Log.info("********** The instance's hostname is '#{instance['hostname']}'
 **********")
Chef::Log.info("********** The instance's hostname is '#{instance['hostname']}'
**********")
end
instance = search("aws_opsworks_instance").each do |instance|
 Chef::Log.info("********** The instance's hostname is '#{instance['ec2_instance_id']}'
 **********")
 Chef::Log.info("********** The instance's ID is '#{instance['ec2_instance_id']}'
 **********")
end
