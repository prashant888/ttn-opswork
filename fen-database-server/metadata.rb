name             'fen-database-server'
maintainer       'FEN'
maintainer_email 'erich.beyrent@fen.com'
license          'All rights reserved'
description      'Installs/Configures fen-database-server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports          'ubuntu'

recipe            'fen-database-server', 'Sets up dependencies'
recipe            'fen-database-server::poptropica', 'Sets up MySQL database servers for Poptropica'
recipe            'fen-database-server::tveditor', 'Sets up PostgreSQL database servers for Teachervision'
recipe            'fen-database-server::community', 'Sets up Percona database servers for blogs, forums, and the newsletter centers'
recipe            'fen-database-server::redmine', 'Sets up Percona database servers for redmine instances'
recipe            'fen-database-server::mysql-ebs-volume', 'Maps an EBS volume mounted as /vol/mysql to /var/lib/mysql'
recipe            'fen-database-server::postgresql-ebs-volume', 'Maps an EBS volume mounted as /vol/postgresql'

depends 'percona'
depends 'postgresql'
depends 'fen-base-server'