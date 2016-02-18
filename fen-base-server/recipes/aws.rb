#
# Cookbook Name:: fen-base-server
# Recipe:: aws
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

# Replace this with internal DNS name
#node.override['rsyslog']['server_ip'] = '52.6.158.79'
  
# Configure the Zabbix Agent
node.override['zabbix']['agent']['servers'] = 'mon01.fen.com'

# Configure the ntp servers
node.override['ntp']['servers'] = %w(0.amazon.pool.ntp.org 1.amazon.pool.ntp.org 2.amazon.pool.ntp.org 3.amazon.pool.ntp.org)

# Configure snmp
node.override['snmp']['community'] =  'lnfen'
node.override['snmp']['full_systemview'] = true
#node.default['snmp']['include_all_disks'] = true
node.override['snmp']['syscontact'] = 'sms-admin@fen.com'  
node.override['snmp']['syslocationVirtual'] = 'AWS EC2'
node.default['snmp']['disks'] = [
  {:mount => '/', :min => '10%'},
  {:mount => '/var', :min => '5%'}
#  {:mount => "/site", :min => "5%"},
]
#node.override['snmp']['snmpd']['snmpd_opts'] = '-Lsd -Lf /dev/null -u snmp -I -smux -p /var/run/snmpd.pid -c /etc/snmp/snmpd.conf'
node.default['snmp']['load_average'] = {:max1 => '24', :max5 => '12', :max15 => '6'}

node.override['s3cmd']['users'] = %w[root ubuntu]
  
include_recipe 'fen-base-server::default'
include_recipe 'fen-aws'
include_recipe 'fen-s3cmd'
include_recipe 'rsyslog::client'
include_recipe 'zabbix-agent'
include_recipe 'ntp'
include_recipe 'snmp'