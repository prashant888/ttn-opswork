name             'fen-ntp'
maintainer       'Karl DeBisschop'
maintainer_email 'karl.debisschop@fen.com'
license          'All rights reserved'
description      'Installs/Configures NTP'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports         'ubuntu'

recipe           'fen-ntp-server::server', 'Creates an NTP Server (on a public subnet)'
recipe           'fen-ntp-server::client', 'Creates an NTP Client (on a private subnet)'

depends          'ntp'
