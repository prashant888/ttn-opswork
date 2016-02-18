name             'fen-apache2'
maintainer       'FEN'
maintainer_email 'erich.beyrent@fen.com'
license          'All rights reserved'
description      'Installs/Configures fen-apache2'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports          'ubuntu'

recipe            'fen-apache2', 'Installs apache2, modules used by FEN'
recipe            'fen-apache2::mod_geoip2', 'Installs and configures geoip, geoipupdate, mod_geoip'
  
depends 'apache2'
depends 'cron'