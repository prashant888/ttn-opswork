#instance = search("aws_opsworks_instance").first
#Chef::Log.info("********** The instance's hostname is '#{instance['hostname']}'
# **********")
#Chef::Log.info("********** The instance's ID is '#{instance['instance_id']}'
#**********")
search("aws_opsworks_instance").each do |instance|
puts "Hostname is : '#{instance['hostname']}'"

puts "Private Ip  is : '#{instance['private_ip']}'"
 
 puts "instance's ID is '#{instance['instance_id']}'"
end
