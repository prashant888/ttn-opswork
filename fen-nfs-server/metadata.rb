name             'fen-database-server'
maintainer       'Family Education Network'
maintainer_email 'karl.debisschop@fen.com'
license          'All rights reserved'
description      'Installs/Configures fen-mail-relay'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports          'ubuntu'

recipe            'fen-nfs-server::default', 'Sets up dependencies and exports /srv/nfs'
recipe            'fen-nfs-server::staging', 'Sets up webadmin-controlled staging directory for export'

depends 'fen-base-server'
depends 'fen-users'

depends 'line'
depends 'nfs'
