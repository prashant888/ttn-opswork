all_hosts = {}
all_hostgroups = {}

# Gets all (online only) instances in OpsWorks stack
all_instances = search(:node, 'role:*')
all_instances.each do |instance|
  node_hostgroups = {}
  node_hostgroups.each do |node_hostgroups|
    puts node_hostgroups
end
  # add a hostgroup for each layer the instance is in
  end

