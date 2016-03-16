include_recipe 'nrpe::default'
node.override['nrpe']['allowed_hosts'] = '1.2.3.4'
node.default['nrpe']['server_address'] = '1.2.3.4'
