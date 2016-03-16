include_recipe 'nrpe::default'
node.override['nrpe']['server_address'] = '3.3.3.3'
node.override['nrpe']['allowed_hosts'] = %w(3.3.3.3)

file_name = '/etc/nagios/nrpe.cfg'
file_name.gsub!('127.0.0.1','3.3.3.3')
