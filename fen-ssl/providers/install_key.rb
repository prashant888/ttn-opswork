#
# Cookbook name:: fen-ssl
# Provider:: install_key
#

action :install do
  cookbook_file "#{node['fen-ssl']['ssl_key_dir']}/#{new_resource.key_file}" do
    source "#{new_resource.key_file}"
    owner 'root'
    group 'root'
    mode '0600'
  end
end

