node.override['ntp']['is_server'] = true
node.override['ntp']['peers'] = node['ntp']['cluster']
node.override['ntp']['restrictions'] = ['10.0.0.0 mask 255.255.0.0 nomodify notrap']