
np = gem_package 'nagios_parser' do
  version "1.3.0"
  action :install
end

require 'nagios_parser/object/parser'

services_file_path='/etc/nagios3/services.d/'

# read config file
Dir.glob("#{services_file_path}*.cfg") do |config_file|

	config_parsed = NagiosParser::Object::Parser.parse(File.read(config_file))
	_basic = []
	_advanced = []
	config_parsed['service'].each do |node|
		if node['service_description'].include? 'Disk_Space'
			_advanced.push("#{node['host_name']},#{node['service_description']}")
		else
			_basic.push("#{node['host_name']},#{node['service_description']}")
		end
	end
	items_basic = _basic.join " "
	items_advanced = _advanced.join " "
	
	puts items_basic
	puts items_advanced
# end

# Dir.chdir(services_file_path)
# Dir.glob('*.cfg') do |files|
	filename = config_file.gsub!('.cfg','')

	template "/etc/nagios3/servicegroup.d/#{filename}.cfg" do |file|
		source "servicegroup.erb"
		owner "root"
		group "root"
		mode "0755"
		variables( :items_basic_string => items_basic,
			   :items_advanced_string => items_advanced)
		end
end














# write config files
#/etc/nagios3/servicegroup.d

