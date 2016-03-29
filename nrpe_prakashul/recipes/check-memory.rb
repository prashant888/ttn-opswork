include_recipe 'fen-nrpe::default'

cookbook_file '/usr/lib/nagios/plugins/check_mem' do
  source 'check_mem'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

nrpe_check "check_mem" do
 command "#{node['nrpe']['plugin_dir']}/check_mem"
 warning_condition '80%'
 critical_condition '90%'
 parameters '-u -C'
 action :add
notifies :restart, "service[nagios-nrpe-server]"
end
