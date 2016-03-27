nagios_path="/etc/nagios3/nagios.cfg"

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

directory '/etc/nagios3/contacts.d' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory '/etc/nagios3/contactgroup.d' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory '/etc/nagios3/service_escalation.d' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end




ruby_block "insert_line" do
  block do
    file = Chef::Util::FileEdit.new("#{nagios_path}")
    file.insert_line_if_no_match("cfg_dir=/etc/nagios3/host.d/", "cfg_dir=/etc/nagios3/host.d" )
    file.insert_line_if_no_match("cfg_dir=/etc/nagios3/hostgroup.d/", "cfg_dir=/etc/nagios3/hostgroup.d" )
    file.insert_line_if_no_match("cfg_dir=/etc/nagios3/services.d/", "cfg_dir=/etc/nagios3/services.d" )
    file.insert_line_if_no_match("cfg_dir=/etc/nagios3/contacts.d/", "cfg_dir=/etc/nagios3/contacts.d" )
    file.insert_line_if_no_match("cfg_dir=/etc/nagios3/contactgroup.d", "cfg_dir=/etc/nagios3/contactgroup.d")
    file.insert_line_if_no_match("cfg_dir=/etc/nagios3/service_escalation.d", "cfg_dir=/etc/nagios3/service_escalation.d" )
	file.write_file
  end
end

#execute 'nagios restart' do
#  command '/etc/init.d/nagios3 restart'
#end
