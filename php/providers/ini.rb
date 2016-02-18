action :install do
  template "#{new_resource.conf_dir}/php.ini" do
    source node['php']['ini']['template']
    cookbook node['php']['ini']['cookbook']
    unless platform?('windows')
      owner 'root'
      group node['root_group']
      mode '0644'
    end
    variables(:directives => node['php']['directives'])
  end
end