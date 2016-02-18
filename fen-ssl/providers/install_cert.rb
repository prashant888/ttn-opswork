#
# Cookbook name:: fen-ssl
# Provider:: install_cert
#

action :install do
  cookbook_file "#{node['fen-ssl']['ssl_cert_dir']}/#{new_resource.key_file}" do
    source "#{new_resource.key_file}"
    owner 'root'
    group 'root'
    mode '0644'
  end
end

