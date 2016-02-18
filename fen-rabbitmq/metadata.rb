name             'fen-rabbitmq'
maintainer       'FEN'
maintainer_email 'erich.beyrent@fen.com'
license          'All rights reserved'
description      'Installs/Configures fen-rabbitmq'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports 'ubuntu'

recipe 'fen-rabbitmq', 'Provides installation and configuration for RabbitMQ for most environments'
recipe 'fen-rabbitmq::production', 'Provides installation and configuration for RabbitMQ for production environments'

depends 'rabbitmq'