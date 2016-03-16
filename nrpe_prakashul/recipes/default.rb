include_recipe 'nrpe::default'
node.override['nrpe']['server_address'] = '3.3.3.3'
node.override['nrpe']['allowed_hosts'] = %w(3.3.3.3)

ruby_block "insert_line" do
  block do
    file = Chef::Util::FileEdit.new("/etc/nagios/nrpe.cfg")
    file.search_file_replace_line("/127\.0\.0\.1/", "3\.3\.3\.3")
    file.write_file
  end
end
