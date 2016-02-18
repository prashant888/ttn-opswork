name             'fen-blogs-forums'
maintainer       'FEN'
maintainer_email 'erich.beyrent@fen.com'
license          'All rights reserved'
description      'Installs/Configures fen-blogs-forums'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports 'ubuntu'

recipe 'fen-blogs-forums', 'Sets up dev instances of the Drupal blogs and forums'
#recipe 'fen-blogs-forums::production', 'Sets up production instances of the Drupal blogs and forums'
recipe 'fen-blogs-forums::database', 'Creates the database, users, priviledges, and imports the database from backup'

depends 'fen-web-server'
depends 'fen-s3cmd'
depends 'drush'