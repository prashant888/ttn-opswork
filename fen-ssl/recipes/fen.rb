
key = 'star.fen.com.key'
fen_ssl_install_key "#{node['fen-ssl']['ssl_key_dir']}/#{key}" do
  key_file key
end

cert = 'star.fen.com.crt'
fen_ssl_install_cert "#{node['fen-ssl']['ssl_cert_dir']}/#{cert}" do
  key_file cert
end

include_recipe 'fen-ssl::csc_bundle'