include_recipe 'fen-nrpe::default'
nrpe_check "check_disk" do
 command "#{node['nrpe']['plugin_dir']}/check_disk"
 parameters '-p /'
 warning_condition '20%'
 critical_condition '10%'
 action :add
notifies :restart, "service[nagios-nrpe-server]"
end
