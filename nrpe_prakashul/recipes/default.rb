include_recipe 'nrpe::default'
node.override['nrpe']['allowed_hosts'] = ['3.3.3.3', '2.2.2.2']
node.override['nrpe']['server_address'] = '3.3.3.3'
