case node['platform_family']
when 'debian'
  default['fen-ssl']['ssl_dir'] = '/etc/ssl'
when 'rhel'
  default['fen-ssl']['ssl_dir'] = '/etc/pki/tls'
else
  default['fen-ssl']['ssl_dir'] = '/opt/ssl'
end

default['fen-ssl']['ssl_key_dir'] = "#{node['fen-ssl']['ssl_dir']}/private"
default['fen-ssl']['ssl_cert_dir'] = "#{node['fen-ssl']['ssl_dir']}/certs"
