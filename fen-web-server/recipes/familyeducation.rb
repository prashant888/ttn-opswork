node.set['apache']['server_name'] = 'www.familyeducation.com'
  
include_recipe 'fen-web-server'
include_recipe 'fen-web-server::global'

apache_conf '000-default' do
  enable true
end
