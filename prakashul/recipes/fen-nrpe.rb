cookbook_file '/etc/nagios/nrpe.cfg' do
  source 'nrpe.cfg'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
