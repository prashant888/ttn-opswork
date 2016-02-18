name             'fen-utility-stack'
maintainer       'FEN'
maintainer_email 'erich.beyrent@fen.com'
license          'All rights reserved'
description      'Installs/Configures fen-utility-stack'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports 'ubuntu'

recipe 'fen-utility-stack::responsys-sync', 'Sets up the Responsys sync alert cron jobs'
recipe 'fen-utility-stack::supervisor', 'Sets up the Supervisor jobs for syncing with Responsys'

depends 'supervisor'
