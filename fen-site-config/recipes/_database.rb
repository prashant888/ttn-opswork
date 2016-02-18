# Searches for a database in this stack
# Currently assumes the first one it finds is the one we want

databases = search('aws_opsworks_instance', 'hostname:postgresql*')
if databases.empty?
  dbhost = 'localhost'
else
  db_instance = databases.first
  dbhost = db_instance[:private_ip]
end

node.default['fen']['sitevars']['global']['DB_HOST'] = dbhost
