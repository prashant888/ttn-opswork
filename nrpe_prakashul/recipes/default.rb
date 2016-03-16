include_recipe 'nrpe::default'
node.override['nrpe']['server_address'] = '3.3.3.3'
node.override['nrpe']['allowed_hosts'] = %w(3.3.3.3)

file_names = ['/etc/nagios/nrpe.cfg']

file_names.each do |file_name|
  text = File.read(file_name)
  new_contents = text.gsub(/127.0.0.1/, "3.3.3.3")

  # To merely print the contents of the file, use:
  puts new_contents

  # To write changes to the file, use:
  File.open(file_name, "w") {|file| file.puts new_contents }
end
