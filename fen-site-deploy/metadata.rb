name             'fen-site-deploy'
maintainer       'FEN'
maintainer_email 'erich.beyrent@fen.com'
license          'All rights reserved'
description      'Installs/Configures fen-site-deploy'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports 'ubuntu'

recipe 'fen-site-deploy', 'No-op'
recipe 'fen-site-deploy::production', 'Sets up /site directory tree, copies code from nfs mount'
recipe 'fen-site-deploy::production-reference', 'Reference-specific deployment of /site'
recipe 'fen-site-deploy::production-teachervision', 'Teachervision-specific deployment of /site'
recipe 'fen-site-deploy::production-familyeducation', 'Familyeducation-specific deployment of /site'
recipe 'fen-site-deploy::production-poptropica', 'Poptropica-specific deployment of /site'

recipe 'fen-site-deploy::external-libs', 'Helper for deploying external libraries from Composer'
recipe 'fen-site-deploy::lesson-plans', 'Helper for deploying lesson plan cache'

depends 'fen-base-server'
depends 'fen-apache2'
depends 'fen-mail-relay'
