
nagios_path='/etc/nagios3'


include_recipe "nagios::server_package"

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


#####Include directories in nagios
#Dir.chdir(nagios_path)
#open('nagios.cfg', 'w') { |f|
#  f << "cfg_dir=/etc/nagios3/host.d\n"
#  f << "cfg_dir=/etc/nagios3/hostgroup.d\n"
#  f << "cfg_dir=/etc/nagios3/services.d\n"
#}
#


ruby_block "insert_line" do
  block do
    file = Chef::Util::FileEdit.new("/etc/nagios/nrpe.cfg")
    file.insert_line_if_no_match(cfg_dir=/etc/nagios3/host.d, newline)
	file.write_file
    file.insert_line_if_no_match(cfg_dir=/etc/nagios3/hostgroup.d, newline)
	file.write_file
    file.insert_line_if_no_match(cfg_dir=/etc/nagios3/services.d, newline)
	    file.write_file
  end


notifies :restart, 'service[nagios]', :immediately
