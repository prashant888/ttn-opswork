fen_ssl_install_key 'install_key' do
  key_file 'star.dev.poptropica.com.key'
end

fen_ssl_install_cert 'install_cert' do
  key_file 'star.dev.poptropica.com.crt'
end

include_recipe 'fen-ssl::csc_bundle'