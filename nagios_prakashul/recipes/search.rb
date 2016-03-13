all_hosts = {}
all_hostgroups = {}

# Gets all (online only) instances in OpsWorks stack
all_instances = search(:node, 'role:*')
all_instances.each do |instance|
  node_hostgroups = {}
end
  puts node_hostgroups.inspect
	#instance['opsworks']['layers'].each do |layer_id, layer_info|
#    node_hostgroups[layer_id] = layer_info['name']
#  end

  # add a hostgroup for each layer the instance is in
