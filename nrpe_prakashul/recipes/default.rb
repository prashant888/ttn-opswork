include_recipe 'nrpe::default'
node.override['nrpe']['server_address'] = '3.3.3.3'
