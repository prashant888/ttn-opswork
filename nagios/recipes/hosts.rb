all_hosts = {}
all_hostgroups = {}

node['kronos']['layers'].each do |layer_id, layer_info|
  all_hostgroups[layer_id] = layer_info['name']
  layer_info['instances'].each do |instance_name, instance_info|
    if instance_info['status'] == 'online'
      node_hostgroups[instance_info['availability_zone']] = instance_info['availability_zone']
      node_hostgroups[layer_id] = layer_info['name']

      all_hostgroups = all_hostgroups.merge(node_hostgroups)
      if all_hosts.has_key?(instance_name)
        # host is in more than one layer - so merge them
        all_hosts[instance_name][:hostgroups] = all_hosts[instance_name][:hostgroups].merge(node_hostgroups)
      else
        all_hosts[instance_name] = {
          :hostgroups => node_hostgroups,
          :private_ip => instance_info['private_ip']
        }
      end
    end
  end
end
