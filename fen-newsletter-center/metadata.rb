name             'fen-newsletter-center'
maintainer       'FEN'
maintainer_email 'erich.beyrent@fen.com'
license          'All rights reserved'
description      'Installs/Configures fen-newsletter-center'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports 'ubuntu'

recipe 'fen-newsletter-center', 'Sets up dev instances of the Drupal newsletter center'
recipe 'fen-newsletter-center::production', 'Sets up production instances of the Drupal newsletter center'
recipe 'fen-newsletter-center::responsys-sync', 'Sets up the Responsys sync alert cron jobs'
recipe 'fen-newsletter-center::supervisor', 'Sets up the Supervisor jobs for syncing with Responsys'
recipe 'fen-newsletter-center::database', 'Creates the database, users, priviledges, and imports the database from backup'

depends 'fen-web-server'
depends 'fen-s3cmd'
depends 'supervisor'
depends 'drush'