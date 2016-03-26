
np = gem_package 'nagios_parser' do
  version "1.3.0"
  action :install
end

require 'nagios_parser/object/parser'

services_file_path='/etc/nagios3/services.d/'

# read config file
items_basic = {}
items_advanced = {}
Dir.glob('/etc/nagios3/services.d/*.cfg') do |config_file|

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
	items_basic[config_file] = _basic.join " "
	items_advanced[config_file] = _advanced.join " "

end

Dir.chdir(services_file_path)
Dir.glob('*.cfg') do |files|
files.gsub!('.cfg','')

template "/etc/nagios3/servicegroup.d/#{files}.cfg" do |file|
        source "servicegroup.erb"
        owner "root"
        group "root"
        mode "0755"
        variables( :items_basic_string => items_basic[file],
		   :items_advanced_string => items_advanced[file] )
        end
end














# write config files
#/etc/nagios3/servicegroup.d

