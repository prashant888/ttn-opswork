node.default['php']['modules']['php5-pspell'] = true
node.default['php']['modules']['php5-sqlite'] = true
node.default['php']['modules']['php5-xdebug'] = true
node.default['php']['modules']['php5-xhprof'] = true
node.default['php']['modules']['php5-xsl'] = true

node.default['php']['directives']['date.timezone'] = 'UTC'

node.default['composer']['cache_dir'] = '/opt/composer'

node.default['jenkins']['master']['install_method'] = 'package'
node.default['jenkins']['master']['jenkins_args'] =
    '--httpsPort=8443 --httpsKeyStore=/etc/ssl/jenkins.jks --httpsKeyStorePassword=tvQfaN7,duz0'
