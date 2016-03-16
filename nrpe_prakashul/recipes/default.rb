include_recipe 'nrpe::default'
node.override['nrpe']['server_address'] = '1.2.3.4'
node.override['nrpe']['allowed_hosts'] = '1.2.3.4'
