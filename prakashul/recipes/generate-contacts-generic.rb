
np = gem_package 'nagios_parser' do
  version "1.3.0"
  action :install
end

#require 'nagios_parser/object/parser'
chef_gem 'nagios_parser/object/parser'


hgroup_file_path='/etc/nagios3/hostgroup.d/'
email='prakashul@gmail.com'
# read config file
Dir.glob("#{hgroup_file_path}*.cfg") do |config_file|

	config_parsed = NagiosParser::Object::Parser.parse(File.read(config_file))
	_contacts = []
	config_parsed['hostgroup'].each do |node|
			_contacts.push("#{node['hostgroup_name']}")
		end
	items_contacts = _contacts.join ","
	puts items_contacts

template "/etc/nagios3/contacts.d/#{items_contacts}.cfg" do 
	 source "contacts-generic.erb"
	 owner "root"
	 group "root"
	 mode "0755"
	 variables( :items_contacts => items_contacts,
                          :email => email      )
end


end

