service_file_path='/etc/nagios3/hostgroup.d/'
Dir.chdir(service_file_path)
Dir.glob('*.cfg') do |files|
files.gsub!('.cfg','')
puts files

end





#irb(main):001:0> Dir.chdir("/home/ttnd/fen_prashant/ttn-opswork/nagios/recipes/")
#=> 0
#irb(main):002:0> Dir.glob('*.rb') do |files|
#irb(main):003:1*  files.gsub!('.rb','')
#irb(main):004:1> 
#irb(main):005:1*  puts files
#irb(main):006:1> end
#
