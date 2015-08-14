line = "%sap    ALL= NOPASSWD: /usr/sbin/apache2*
%sap    ALL= NOPASSWD: /usr/local/bin/apache2*
#%sap    ALL= NOPASSWD: /usr/local/bin/restart-sauce-connect
# Temp, so Brian can't accidentally start something we can't stop.
%sap    ALL= NOPASSWD: /usr/local/bin/restart-sauce-connect
jenkins ALL= NOPASSWD: /usr/sbin/apache2*
jenkins ALL= NOPASSWD: /usr/local/bin/restart-sauce-connect
"
file = Chef::Util::FileEdit.new('/etc/sudoers.d/adoptapet')
file.insert_line_if_no_match(/#{line}/, line)
file.write_file
