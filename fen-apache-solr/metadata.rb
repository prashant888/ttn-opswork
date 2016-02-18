name             'fen-apache-solr'
maintainer       'FEN'
maintainer_email 'erich.beyrent@fen.com'
license          'All rights reserved'
description      'Installs/Configures fen-apache-solr'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports 'ubuntu'

recipe 'fen-apache-solr', 'Installs and configures java 7, tomcat 7, and Solr 4.0'
recipe 'fen-apache-solr::aws', 'Executes the default recipe and tags the instance with a CostCenter'
  
depends 'fen-aws'
depends 'fen-ssl'
depends 'java'
depends 'tomcat'