name             'fen-graylog-server'
maintainer       'Erich Beyrent'
maintainer_email 'erich.beyrent@fen.com'
license          'All rights reserved'
description      'Installs/Configures fen-graylog-server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'java'
depends 'mongodb'
#depends 'elasticsearch'
depends 'graylog2'