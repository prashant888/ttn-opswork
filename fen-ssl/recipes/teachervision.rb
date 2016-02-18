fen_ssl_install_key 'install_key' do
  key_file 'star.teachervision.com.key'
end

fen_ssl_install_cert 'install_cert' do
  key_file 'star.teachervision.com.crt'
end

include_recipe 'fen-ssl::gd_bundle_g2_g1'