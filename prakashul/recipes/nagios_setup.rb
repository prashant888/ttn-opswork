
nagios_path='/etc/nagios3'


include_recipe 'nagios::default'

directory '/etc/nagios3/host.d' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory '/etc/nagios3/hostgroup.d' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory '/etc/nagios3/services.d' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end


####Include directories in nagios
Dir.chdir(nagios_path)
open('nagios.cfg', 'w') { |f|
  f << "cfg_dir=/etc/nagios3/host.d\n"
  f << "cfg_dir=/etc/nagios3/hostgroup.d\n"
  f << "cfg_dir=/etc/nagios3/services.d\n"
}

notifies :restart, 'service[nagios]', :immediately
