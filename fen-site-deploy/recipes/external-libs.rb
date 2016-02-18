# Copy the vendor directory from the NFS server

command = node['fen']['site']['deploy']['command']
optlist = node['fen']['site']['deploy']['flags']
origin  = node['fen']['site']['deploy']['origin']
nfspath = node['fen']['site']['deploy']['nfspath']
sitegroup = node['fen']['site']['sitegroup']

bash 'staging copy' do
  action :run
  #user node['apache']['user']
  user 'root'
  code <<-EOH
#{command} #{optlist} #{origin}/#{sitegroup}/vendor /site/lib/
  EOH
  only_if { File.exist?("#{nfspath}/#{sitegroup}/vendor") }
end

directory '/site/lib/vendor' do
  owner node['apache']['user']
  group node['apache']['user']
  recursive true
end
