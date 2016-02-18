name             'fen-rsyslog'
maintainer       'Karl DeBisschop'
maintainer_email 'karl.debisschop@fen.com'
license          'All rights reserved'
description      'Installs and configures rsyslog'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe 'fen-rsyslog::collector', 'Configure instance to accept data from remotes'

depends 'rsyslog'