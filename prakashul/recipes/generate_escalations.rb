
gem_package 'nagios_parser' do
  version "1.3.0"
  action :install
end

require 'nagios_parser/object/parser'

hostgroup_file_path = "/etc/nagios3/hostgroup.d/"

_hgroup = []

# read config file
Dir.glob("#{hostgroup_file_path}*.cfg") do |config_file|

	config_parsed = NagiosParser::Object::Parser.parse(File.read(config_file))
	config_parsed['hostgroup'].each do |node|
		_hgroup.push node['host_name']
	end
	
end
hostgrouplist = _hgroup.join ","
puts hostgrouplist
#Dir.chdir(services_file_path)
#Dir.glob('*.cfg') do |files|
#	filename = File.basename(config_file)
#
#	template "/etc/nagios3/servicegroup.d/#{filename}" do |file|
#		source "servicegroup.erb"
#		owner "root"
#		group "root"
#		mode "0755"
#		variables( :items_basic_string => items_basic,
#			   :items_advanced_string => items_advanced)
#		end
#end















