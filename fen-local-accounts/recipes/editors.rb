#
# Cookbook Name:: fen-local-accounts
# Attributes:: default
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

accounts = [
  {
    'name' => 'urowebe',
    'uid' => 12009,
    'gid' => 12009,
    'authorized_keys' => [
      'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEAv4fgGxi5exRUvV9mM+zNPDM00IV9wXCTt9YWmXfb0T7MtCUIE00/vlfGTiID/A3lErdOU0+OQ7gydb+rK9hLjmXSBQdd2XzPtMYWo8hBPfkr/8p3/POxo3Q3G2Px4RQ/c7HvyxzjabbSy0UFg+3F6VPVPYmRvchPbdigrBm67m8= urowebe@MACXROWENB2.local'
    ]
  },
  {
      'name' => 'umcnica',
    'uid' => 12010,
    'gid' => 12010,
      'authorized_keys' => [
          'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAz8aBZEnL5KJq2s7iiHMtLkudTGjpFGIO1D5ElEBe8WIfhIyoQ4glMKcpBtJrKT4xbjKNhZi1NQ3Z8xWT+9vzpVhsVQksdTWnsSz3w2gDj9Mhud2Jn0ZK4XaFnbpLFN5c2rTEbSmpif3njdl8GkESzmcb/vqnJDhA5Kke7x+VDOE= rsa-key-20130604-Catherine Mcniff'
      ]
  },
  {
    'name' => 'uwoodj2',
    'uid' => 12011,
    'gid' => 12011,
    'authorized_keys' => [
      'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIBrG5Zwgg7mYDuYgXT7R3/8eE2lhwp+Ppv2gHFtGZhR46GolUVJ7jge5arsGFNQ0HJJUHuiiL8ve+smDuQDVwSzCmMd/YdFMJeMDZZvJESkOm88Dj6c+19DR6jzuPgNMi98cy0YmTfoAAXIbf5rOFPgmjNxkCbnnjOTl8ysBfVzJQ== rsa-key-20110215-Jennie Wood'
    ]
  }
]

accounts.each do |local_account|
  fen_local_accounts_account local_account['name'] do
    uid local_account['uid']
    gid local_account['gid']
    authorized_keys local_account['authorized_keys']
  end
end