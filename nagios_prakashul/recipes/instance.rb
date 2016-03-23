#instance = search("aws_opsworks_instance").first
#Chef::Log.info("********** The instance's hostname is '#{instance['hostname']}'
# **********")
#Chef::Log.info("********** The instance's ID is '#{instance['instance_id']}'
#**********")
#search("aws_opsworks_instance").each do |instance|
#puts "Hostname is : '#{instance['hostname']}'"
#puts "Private Ip  is : '#{instance['private_ip']}'"
#puts "instance's ID is '#{instance['ec2_instance_id']}'"
#end

directory '/etc/nagios3/host.d' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory '/etc/nagios3/hostgroup.d' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

search("aws_opsworks_instance").each do |instance|

template '/etc/nagios3/host.d/address.cfg' do
  source 'hosts.cfg.erb'
  mode '0755'
  owner 'root'
  group 'root'
  variables(
	   :address => instance['private_ip'],
	   :name => instance['hostname']
         )	  
end
end
