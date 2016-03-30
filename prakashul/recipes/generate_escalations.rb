chef_gem 'nagios_parser'
require 'nagios_parser/object/parser'

hostgroup_file_path = "/etc/nagios3/hostgroup.d/"

_hgroup = []

# read config file
Dir.glob("#{hostgroup_file_path}*.cfg") do |config_file|

	config_parsed = NagiosParser::Object::Parser.parse(File.read(config_file))
	config_parsed['hostgroup'].each do |node|
		_hgroup.push node['hostgroup_name']
	end
	
end


hostgrouplist = _hgroup.join ","
puts hostgrouplist


template "/etc/nagios3/service_escalation.d/escalation.cfg" do 
	source "service_escalation.erb"
	owner "root"
	group "root"
	mode "0755"
	variables( :hostgrouplist => hostgrouplist)
end
