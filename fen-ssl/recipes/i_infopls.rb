fen_ssl_install_key 'install_key' do
  key_file 'i.infopls.com.key'
end

fen_ssl_install_cert 'install_cert' do
  key_file 'i.infopls.com.crt'
end

include_recipe 'fen-ssl::csc_bundle'