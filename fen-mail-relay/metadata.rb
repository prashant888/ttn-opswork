name             'fen-database-server'
maintainer       'Family Education Network'
maintainer_email 'karl.debisschop@fen.com'
license          'All rights reserved'
description      'Installs/Configures fen-mail-relay'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports          'ubuntu'

recipe            'fen-mail-relay', 'Sets up dependencies'
recipe            'fen-mail-relay::server', 'Set up smart host/relay server'
recipe            'fen-mail-relay::client', 'Set up client'

depends 'fen-base-server'
depends 'fen-ssl'
depends 'postfix'
