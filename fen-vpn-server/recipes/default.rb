#
# Cookbook Name:: fen-database-server
# Recipe:: tveditor
#
node.default['openvpn']['type'] = 'server';
#node['openvpn']['subnet'] - Used for server mode to configure a VPN subnet to draw client addresses. Default is 10.8.0.0, which is what the sample OpenVPN config package uses.
#node['openvpn']['netmask'] - Netmask for the subnet, default is 255.255.0.0.
#node['openvpn']['gateway'] - FQDN for the VPN gateway server. Default is node['fqdn'].
node.default['openvpn']['push_routes'] = ['route 10.0.0.0 255.255.0.0'];
#node['openvpn']['push_options'] - Array of options to to push to clients in the server.conf. Default is empty.
#node['openvpn']['configure_default_server'] - Boolean. Set this to false if you want to create all of your "conf" files with the LWRP.
#node['openvpn']['key_dir'] - Location to store keys, certificates and related files. Default /etc/openvpn/keys.
#node['openvpn']['signing_ca_cert'] - CA certificate for signing, default /etc/openvpn/keys/ca.crt
#node['openvpn']['signing_ca_key'] - CA key for signing, default /etc/openvpn/keys/ca.key
node.default['openvpn']['config']['local'] = '*';
node.default['openvpn']['config']['proto'] = 'tcp';
node.default['openvpn']['config']['port'] = 443;
#node['openvpn']['config']['log'] - Server log file. Default /var/log/openvpn.log
node.default['openvpn']['config']['script-security'] = 2;

#node['openvpn']['key']['ca_expire'] - In how many days should the root CA key expire - CA_EXPIRE.
#node['openvpn']['key']['expire'] - In how many days should certificates expire - KEY_EXPIRE.
#node['openvpn']['key"]['size'] - Default key size, set to 2048 if paranoid but will slow down TLS negotiation performance - KEY_SIZE.

node.default['openvpn']['key']['country'] = 'US';
node.default['openvpn']['key']['province'] = 'MA';
node.default['openvpn']['key']['city'] = 'Boston';
node.default['openvpn']['key']['org'] = 'Family Education Network';
node.default['openvpn']['key']['email'] = 'karl.debisschop@fen.com';

#include_recipe 'openvpn'
include_recipe 'openvpn::server';

