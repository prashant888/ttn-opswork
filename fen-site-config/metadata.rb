name             'fen-site-config'
maintainer       'FEN'
maintainer_email 'erich.beyrent@fen.com'
license          'All rights reserved'
description      'Installs/Configures fen-site-config'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports 'ubuntu'

recipe 'fen-site-config', 'Sets up prepend and sitevars files'
recipe 'fen-site-config::teachervision', 'Sets up prepend and sitevars files for Teachervision'
recipe 'fen-site-config::familyeducation', 'Sets up prepend and sitevars files for Teachervision'
recipe 'fen-site-config::refsites', 'Sets up prepend and sitevars files for Reference sites'