include_recipe 'nrpe::default'
node.override['nrpe']['server_address'] = '3.3.3.3'
node.override['nrpe']['allowed_hosts'] = %w(3.3.3.3)


def stringReplace(127.0.0.1, 3.3.3.3, /etc/nagios/nrpe.cfg)
  aFile = File.open(fileName, "r")
  aString = aFile.read
  aFile.close

  aString.gsub!(127.0.0.1, 3.3.3.3)

  File.open(fileName, "w") { |file| file << aString }
end

stringReplace(*ARGV)
