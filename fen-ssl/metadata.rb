name             'fen-ssl'
maintainer       'Family Education Network'
maintainer_email 'karl.debisschop@fen.com'
license          'All rights reserved'
description      'Installs/Configures FEN SSL Chains'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports          'ubuntu'

recipe            'fen-ssl::csc_bundle', 'Installs certificates'
recipe            'fen-ssl::dev_poptropica', 'Installs certificates'
recipe            'fen-ssl::fen', 'Installs certificates'
recipe            'fen-ssl::funbrain', 'Installs certificates'
recipe            'fen-ssl::gd_bundle_g2_g1', 'Installs certificates'
recipe            'fen-ssl::i_infopls', 'Installs certificates'
recipe            'fen-ssl::poptropica', 'Installs certificates'
recipe            'fen-ssl::teachervision', 'Installs certificates'
recipe            'fen-ssl::xpop_poptropica', 'Installs certificates'
