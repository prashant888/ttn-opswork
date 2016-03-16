include_recipe 'nrpe::default'
node.override['nrpe']['server_address'] = '3.3.3.3'
node.override['nrpe']['allowed_hosts'] = %w(3.3.3.3)

bash 'add allowed hosts' do
  code <<-EOH
   cat << EOF >> "/etc/nagios/nrpe.cfg"

##########CHEF NRPE#################

pid_file=/var/run/nagios/nrpe.pid
server_port=5666
server_address=3.3.3.3
nrpe_user=nagios
nrpe_group=nagios
dont_blame_nrpe=0
debug=0
command_timeout=60

allowed_hosts=3.3.3.3
include_dir=/etc/nagios/nrpe.d

EOF 
    EOH
end
