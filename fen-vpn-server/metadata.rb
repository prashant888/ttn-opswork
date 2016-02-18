name             'fen-vpn-server'
maintainer       'Family Education Network'
maintainer_email 'karl.debisschop@fen.com'
license          'All rights reserved'
description      'Installs/Configures fen-vpn-server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports          'ubuntu'

recipe            'fen-vpn-server', 'Sets up dependencies'

depends 'openvpn'
