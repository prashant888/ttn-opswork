#
# Cookbook Name:: fen-apache2
# Recipe:: mod_geoip2
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'cron'

# Add the MaxMind PPA repo
apt_repository 'maxmind' do
  uri          'ppa:maxmind/ppa'
  distribution node['lsb']['codename']
end

# Delete the GeoIP.conf file bef
if File.exists?('/etc/GeoIP.conf')
  file '/etc/GeoIP.conf' do
    action :delete
  end
end


# Install geoipupdate
package 'geoipupdate' do
  action :install
  options '--force-yes'
end

# Install the geoip CLI utilities
package 'geoip-bin' do
  action :install
end

# Set up the GeoIP conf file with the license data
template '/etc/GeoIP.conf' do
  source 'GeoIP.conf.erb'
  owner 'root'
  group node['root_group']
  mode '0644'
end

# Create the database if it doesn't exist
execute 'geoipupdate' do
  action :run
  command <<-EOF
  /usr/bin/geoipupdate
  chmod -R +r /usr/share/GeoIP
  EOF
end

# Set up the GeoIP update cron job in /etc/cron.d*****  
cron_d 'geoipupdate' do
  minute '0'
  hour '12'
  weekday '3'
  command "sleep $[RANDOM/10]; /usr/bin/geoipupdate 2>&1 | tee /tmp/geoipupdate.log | egrep -v '^(MD5 Digest of installed database|.* up to date|Updating|Updated)' | /usr/bin/ifne /bin/mail -s 'GeoIP update problem' karl.debisschop@fen.com; chmod -R +r /usr/share/GeoIP"
end
