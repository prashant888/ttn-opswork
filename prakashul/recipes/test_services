

service_file_path='/etc/nagios3/hostgroup.d/'
Dir.chdir("#{service_file_path}")
Dir.glob('*.cfg') do |files|
files.gsub!('.cfg','')
puts files
end
