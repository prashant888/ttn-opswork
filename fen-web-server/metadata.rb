name             'fen-web-server'
maintainer       'FEN'
maintainer_email 'erich.beyrent@fen.com'
license          'All rights reserved'
description      'Installs/Configures fen-web-server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports 'ubuntu'

recipe            'fen-web-server', 'Sets up global configuration for FEN web applications, deploy keys'
recipe            'fen-web-server::global', 'Sets up global config items'
recipe            'fen-web-server::site-code', 'Deploys FEN shared PHP library code from S3'

recipe            'fen-web-server::familyeducation', 'Initial setup for Familyeducation'
recipe            'fen-web-server::reference',       'Initial setup for Factmonster and Infoplease'
recipe            'fen-web-server::teachervsion',    'Initial setup for Teachervision'

depends 'subversion'
depends 'apt'
depends 'git'
depends 'php'
depends 'fen-apache2'
depends 'fen-php'
depends 'fen-perl'