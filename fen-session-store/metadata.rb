name             'fen-database-server'
maintainer       'Family Education Network'
maintainer_email 'karl.debisschop@fen.com'
license          'All rights reserved'
description      'Installs/Configures fen-mail-relay'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports          'ubuntu'

recipe            'fen-session-store', 'Sets up mongo and openldap server'

depends 'fen-base-server'
depends 'fen-ssl'
depends 'openldap'
depends 'mongodb'
