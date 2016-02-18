
action :copy do
  command = new_resource.command
  ssh = new_resource.ssh
  options = new_resource.options
  origin = new_resource.origin
  local_path = new_resource.local_path
  sitegroup = new_resource.sitegroup
  source_path = new_resource.source_path
  dest_path = new_resource.dest_path

  bash 'staging copy' do
    action :run
    user 'root'
    code <<-EOH
#{command} #{options} #{origin}/#{sitegroup}#{source_path} #{dest_path}
EOH
  end
#    only_if { File.exist?("#{local_path}/#{sitegroup}#{source_path}") }
end