name             'fen-users'
maintainer       'FEN'
maintainer_email 'karl.debisschop@fen.com'
license          'All rights reserved'
description      'Installs/Configures Fen local users and user policies'
long_description 'Install local users and user policies.'
version          '0.1.0'

supports         'debian'
supports         'ubuntu'
supports         'redhat'
supports         'centos'
supports         'fedora'

recipe           'fen-users::webadmin', 'Installs webadmin as a local user with authorized_keys'