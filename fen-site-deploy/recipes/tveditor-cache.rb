directory '/site/cache' do
  action :create
  mode '0755'
  owner node['apache']['user']
  group node['apache']['user']
  recursive true
end

fen_site_deploy_rsync '/site/cache' do
  source_path '/site/cache'
  sitegroup node['fen']['site']['sitegroup']
end

directory '/site/cache' do
  action :create
  mode '0755'
  owner node['apache']['user']
  group node['apache']['user']
  recursive true
end
