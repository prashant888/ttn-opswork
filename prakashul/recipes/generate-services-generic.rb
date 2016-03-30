
chef_gem 'nagios_parser'
require 'nagios_parser/object/parser'

hostgroup_file_path='/etc/nagios3/hostgroup.d/'
contactgroup_file_path='/etc/nagios3/contactgroup.d/'

_services = []
# read config file
Dir.glob("#{hostgroup_file_path}*.cfg") do |config_file|

	config_parsed = NagiosParser::Object::Parser.parse(File.read(config_file))
	config_parsed['hostgroup'].each do |node|
			_services.push("#{node['hostgroup_name']}")
		end
	end
	items_services = _services.join " "
	puts items_services


_services.each do |name|

template "/etc/nagios3/service-generic.d/#{name}.cfg" do
	source "services-generic.erb"
	owner "root"
	group "root"
	mode "0755"
	variables( :name => name)
		end
end

