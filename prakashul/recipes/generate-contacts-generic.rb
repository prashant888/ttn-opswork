np = gem_package 'nagios_parser' do
  version "1.3.0"
  action :install
end

require 'nagios_parser/object/parser'

hgroups_file_path='/etc/nagios3/hostgroup.d/'
contacts_file_path='/etc/nagios3/contacts.d/'

def cgroups (file)

        _parsed = NagiosParser::Object::Parser.parse(File.read(file))
        _items = []
        _parsed['hostgroup'].each do |node|
               _items.push node['hostgroup_name']
        end

        _items.join ","

	end

	contacts = cgroups("#{hgroups_file_path}#{node}.cfg")
	puts contacts
contacts.each do |cont|
#advanced = cgroups("#{hgroups_file_path}#{node}.cfg")

template "/etc/nagios3/contacts.d/#{node}.cfg" do
source "contactgroup.erb"
owner "root"
group "root"
mode "0755"
variables( :advanced => advanced,
           :basic => basic)
