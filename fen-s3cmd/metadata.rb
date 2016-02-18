name             'fen-s3cmd'
maintainer       'FEN'
maintainer_email 'erich.beyrent@fen.com'
license          'All rights reserved'
description      'Installs/Configures fen-s3cmd'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports 'ubuntu'

recipe 'fen-s3cmd', 'Installs and configures the s3cmd command-line utility'
  
depends 'fen-aws'