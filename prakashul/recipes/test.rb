service_file_path='/etc/nagios3/hostgroup.d/'
Dir.chdir("#{service_file_path}")
Dir.glob('*.cfg').each do |files|
files.gsub!('.cfg','')
puts files
puts exit
end
