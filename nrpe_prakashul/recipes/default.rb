include_recipe 'nrpe::default'
node.override['nrpe']['server_address'] = '3.3.3.3'
node.override['nrpe']['allowed_hosts'] = %w(3.3.3.3)

data = File.read("/etc/nagios/nrpe.cfg") 
filtered_data = data.gsub("127.0.0.1", "3.3.3.3") 
# open the file for writing
File.open("/etc/nagios/nrpe.cfg", "w") do |f|
  f.write(filtered_data)
end
