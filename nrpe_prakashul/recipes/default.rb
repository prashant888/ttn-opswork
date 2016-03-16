include_recipe 'nrpe::default'
node.override['nrpe']['server_address'] = '1.2.3.4'
