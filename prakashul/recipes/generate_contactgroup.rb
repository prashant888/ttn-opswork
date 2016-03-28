
np = gem_package 'nagios_parser' do
  version "1.3.0"
  action :install
end

require 'nagios_parser/object/parser'

contacts_file_path='/etc/nagios3/contacts.d/'

# read config file
Dir.glob("#{contacts_file_path}*.cfg") do |config_file|

	config_parsed = NagiosParser::Object::Parser.parse(File.read(config_file))
	_cg = []
	config_parsed['contact'].each do |node|
			_cg.push("#{node['contact_name']}")
	end
		_hgroups = _cg.join ","

	end
	puts _hgroups

#Dir.chdir(contacts_file_path)
#Dir.glob('*.cfg') do |files|

#template "/etc/nagios3/contactgroup.d/cg-generic.cfg" do
#	source "contactgroup-generic.erb"
#	owner "root"
#	group "root"
#	mode "0755"
#	variables( :_hgroups => _hgroups)
#	end
#
#












# write config files
#/etc/nagios3/servicegroup.d

