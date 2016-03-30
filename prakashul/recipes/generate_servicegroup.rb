
chef_gem 'nagios_parser'
require 'nagios_parser/object/parser'

services_file_path='/etc/nagios3/services.d/'

# read config file
Dir.glob("#{services_file_path}*.cfg") do |config_file|

	config_parsed = NagiosParser::Object::Parser.parse(File.read(config_file))
	_basic = []
	config_parsed['service'].each do |node|
			_basic.push("#{node['host_name']},#{node['service_description']}")
		end
	end
	items_basic = _basic.join " "
	
	puts items_basic
# end

#Dir.chdir(services_file_path)
#Dir.glob('*.cfg') do |files|
	filename = File.basename(config_file)

	template "/etc/nagios3/servicegroup.d/#{filename}" do |file|
		source "servicegroup.erb"
		owner "root"
		group "root"
		mode "0755"
		variables( :items_basic_string => items_basic)
		end
end

