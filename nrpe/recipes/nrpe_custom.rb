include_recipe 'default'
mon_host.replace(["#{node['ip_master']}"])
