include_recipe "nrpe::default"
@mon_host = "['127.0.0.1']" 

def parse_set()
  @mon_host = "["#{node['ip_master']}"]"
end
