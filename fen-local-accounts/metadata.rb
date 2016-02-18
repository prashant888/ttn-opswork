name             'fen-local-accounts'
maintainer       'FEN'
maintainer_email 'erich.beyrent@fen.com'
license          'All rights reserved'
description      'Installs/Configures fen-local-accounts'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports 'ubuntu'

recipe 'fen-local-accounts', 'Set up a default list of real users'
recipe 'fen-local-accounts::design', 'Set up design team users'
recipe 'fen-local-accounts::editors', 'Set up editorial team'
recipe 'fen-local-accounts::tothenew', 'Set up To The New'
recipe 'fen-local-accounts::filecopy', 'Set up role used for rsync from nfs1'
