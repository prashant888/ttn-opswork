name             'fen-tveditor'
maintainer       'FEN'
maintainer_email 'erich.beyrent@fen.com'
license          'All rights reserved'
description      'Installs/Configures fen-tveditor'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports 'ubuntu'

recipe            'fen-tveditor', 'Sets up dependencies'
recipe            'fen-tveditor::teachervision', 'Sets up Teachervision web server'
recipe            'fen-tveditor::familyeducation', 'Sets up Familyeducation web server'

recipe            'fen-tveditor::tv-platform-cron', 'Sets up platform cron jobs (for all web servers)'

recipe            'fen-tveditor::tveditor', 'Sets up TV Editor instance for FE and TV'
recipe            'fen-tveditor::tveditor-fe', 'Sets up TV Editor instance for FE'
recipe            'fen-tveditor::tveditor-tv', 'Sets up TV Editor instance for TV'
 
recipe            'fen-tveditor::import-database', 'Sets up Posgresql database server for Teachervision/Familyeducation'
recipe            'fen-tveditor::import-db', 'Sets up Posgresql database server for Reference'

depends 'fen-database-server'
depends 'fen-rabbitmq' 
depends 'fen-site-deploy'
depends 'fen-web-server'
depends 'database'
depends 'postgresql'