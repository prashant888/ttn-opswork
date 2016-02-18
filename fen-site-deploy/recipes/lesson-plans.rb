directory '/site/html/lesson-plans' do
  action :create
  mode '0755'
  owner node['apache']['user']
  group node['apache']['user']
end

command = node['fen']['site']['deploy']['command']
optlist = node['fen']['site']['deploy']['flags']
origin  = node['fen']['site']['deploy']['origin']
nfspath = node['fen']['site']['deploy']['nfspath']
sitegroup = node['fen']['site']['sitegroup']

sync_command = "#{command} #{optlist} #{origin}/#{sitegroup}/lesson-plans /site/html/"

# log command
log 'command' do
  message sync_command
end

# Copy the lesson-plans directory from the NFS server
bash 'staging copy' do
  action :run
  user 'root'
  code sync_command
  only_if { File.exist?("#{nfspath}/#{sitegroup}/lesson-plans") }
end
