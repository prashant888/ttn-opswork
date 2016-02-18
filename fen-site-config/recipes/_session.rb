# Searches for a Mongo Session Store in this stack.
# Currently assumes the first one it finds is the one we want.
# Also Currently assumes LDAP and Session Store are co-located on one server.

session_stores = search('aws_opsworks_instance', 'hostname:ldap*')
if session_stores.empty?
  session_host = 'localhost'
else
  mongo_instance = session_stores.first
  session_host = mongo_instance[:private_ip]
end

node.default['fen']['sitevars']['teachervision']['ldap_hosts'] = [session_host]
node.default['fen']['sitevars']['teachervision']['session_store_mongo'] = ["#{session_host}:27017"]
