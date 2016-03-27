np = gem_package 'nagios_parser' do
  version "1.3.0"
  action :install
end

require 'nagios_parser/object/parser'

services_file_path='/etc/nagios3/contacts.d/'

# read config file
Dir.glob("#{services_file_path}*.cfg") do |config_file|

        config_parsed = NagiosParser::Object::Parser.parse(File.read(config_file))
        _items = []
        config_parsed['contact'].each do |node|
	       _items.push node['contact_name']
        end

        contacts = _items.join ","
	puts contacts
end
