include_recipe 'nrpe::default'
include_recipe 'nrpe::_source_plugins'
node.override['nrpe']['server_address'] = '0.0.0.0'

#ruby_block "insert_line" do
#  block do
#    file = Chef::Util::FileEdit.new("/etc/nagios/nrpe.cfg")
#    file.search_file_replace_line("/127\.0\.0\.1/", "3\.3\.3\.3")
#    file.write_file
#  end
#end

bash "insert_line" do
  user "root"
  code <<-EOS
  sed -i '/allowed_hosts=127\.0\.0\.1/d' /etc/nagios/nrpe.cfg
  echo "allowed_hosts=0.0.0.0" >> /etc/nagios/nrpe.cfg
EOS
end
