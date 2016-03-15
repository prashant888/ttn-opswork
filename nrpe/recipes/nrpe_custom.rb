include_recipe "nrpe::default"
mon_host.replace(["#{node['ip_master']}"])
export mon_host
