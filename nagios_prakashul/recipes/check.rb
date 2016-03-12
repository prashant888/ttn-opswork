node['opsworks']['layers'].each do |layer_id, layer_info|
Chef::Log.info("********** The layer id is '#{layer_id['layer_id']}'
 **********")
end
