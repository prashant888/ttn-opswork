service_file_path='/etc/nagios3/hostgroup.d/'
Dir.chdir("#{service_file_path}")
Dir.glob('*.cfg') do |files|
files.gsub!('.cfg','')

template '/etc/nagios3/services.d/\files}.cfg' do
	source 'services.erb'
	owner 'root'
	group 'root'
	mode '0755'
	variables( :files => files )
	action :create
	end
end
