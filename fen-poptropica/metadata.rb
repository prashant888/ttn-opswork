name             'poptropica'
maintainer       'Family Education Network'
maintainer_email 'erich.beyrent@pearson.com'
license          'All rights reserved'
description      'Installs/Configures poptropica'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports 'amazon'
supports 'ubuntu'

depends "apache2"
depends "php5_ppa"
depends "percona-install"