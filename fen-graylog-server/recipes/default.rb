#
# Cookbook Name:: fen-graylog-server

# Set Java installation attributes
node.override['java']['jdk_version'] = '8'
node.override['java']['install_flavor'] = 'oracle'
node.override['java']['oracle']['accept_oracle_download_terms'] = 'true'
  
# Set ElasticSearch installation attributes
#node.default['elasticsearch']['version']['1.5.2']
#node.default['elasticsearch']['cluster']['name'] = 'graylog2'
#node.default['elasticsearch']['node']['name'] = 'graylog2'
  
# Set Graylog2 installation attributes.
#node.default['graylog2']['password_secret'] = 'yNYeZFx6tsUxrsh0Sn4Pp4iF6E3PyGe9DerddrP7dsVMH7zFvtGQJdMJ5ROCv5vMVQtqfLu3jJ4sQk8sUZ6KJATrPDnGqMyj'
#node.default['graylog2']['root_password_sha2'] = '8b2e6a0499872095c52f1afec3fac0a45697c6208c4ba1cb48605c29eee7cc7d'
#node.override['graylog2']['server']['java_opts'] = '-Djava.net.preferIPv4Stack=true'

include_recipe "java"
include_recipe "mongodb"
#include_recipe "elasticsearch"
#include_recipe "graylog2"
#include_recipe "graylog2::server"
#include_recipe "graylog2::api_access"


#graylog2_inputs "syslog udp" do
#  input '{ "title": "syslog", "type":"org.graylog2.inputs.syslog.udp.SyslogUDPInput", "global": true, "configuration": { "port": 1514, "allow_override_date": true, "bind_address": "0.0.0.0", "store_full_message": true, "recv_buffer_size": 1048576 } }'
#end
