np = gem_package 'nagios_parser' do
  version "1.3.0"
  action :install
end

require 'nagios_parser/object/parser'

contacts_file_path='/etc/nagios3/contacts.d/'


def cgroups (file)

	_parsed = NagiosParser::Object::Parser.parse(File.read(file))
        _items = []
        _parsed['contact'].each do |node|
               _items.push node['contact_name']
        end

        _items.join ","
end

advanced = cgroups("#{contacts_file_path}advanced.cfg")
basic = cgroups("#{contacts_file_path}basic.cfg")

puts advanced
puts basic

template "/etc/nagios3/contactgroup.d/cgroup.cfg" do
source "contactgroup.erb"
owner "root"
group "root"
mode "0755"
variables( :advanced => advanced,
           :basic => basic)
end
