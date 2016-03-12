all_hosts = {}
all_hostgroups = {}

# Gets all (online only) instances in OpsWorks stack
all_instances = search(:node, 'role:*')
all_instances.each do |instance|
  node_hostgroups = {}
  node_hostgroups.each do |node|
    puts node
end
	all_instances.each do |num|
    puts num
end
  # add a hostgroup for each layer the instance is in
  end

