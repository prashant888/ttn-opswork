name             'fen-build-farm'
maintainer       'Karl DeBisschop'
maintainer_email 'karl.debisschop@fen.com'
license          'All rights reserved'
description      'Installs/Configures fen-build-farm'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports 'ubuntu'
supports 'debian'
supports 'rhel'
supports 'centos'

recipe 'fen-build-farm', 'Installs and configures java, tomcat, and Jenkins'
recipe 'fen-build-farm::server', 'Installs and configures java, tomcat, and Jenkins master'
recipe 'fen-build-farm::plugins', 'Installs and configures Jenkins plugins'
recipe 'fen-build-farm::aws', 'Executes the default recipe and tags the instance with a CostCenter'
  
depends 'fen-aws'
depends 'fen-php'
depends 'fen-ssl'

depends 'composer'
depends 'iptables'
depends 'jenkins'
