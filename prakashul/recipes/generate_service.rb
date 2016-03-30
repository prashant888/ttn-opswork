np = gem_package 'nagios_parser' do
  version "1.3.0"
  action :install
end

require 'nagios_parser/object/parser'


hostgroup_file_path='/etc/nagios3/hostgroup.d/'
_hgroup = []
# read config file
Dir.glob("#{hostgroup_file_path}*.cfg") do |config_file|

        config_parsed = NagiosParser::Object::Parser.parse(File.read(config_file))
        config_parsed['hostgroup'].each do |node|
                        _hgroup.push("#{node['hostgroup_name']}")
                end
        end
        items_hgroup = _hgroup.join ","
        puts items_hgroup

_hgroup.each do |name|
puts name
template "/etc/nagios3/services.d/#{name}.cfg" do
source "services.erb"
owner "root"
group "root"
mode "0755"
variables(:name => name)
end
end
