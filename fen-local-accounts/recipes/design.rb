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
    'name' => 'uchappa',
    'uid' => 12007,
    'gid' => 12007,
    'authorized_keys' => [
      'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAlTdVgMXmfHM9P8r4qO37eAr8nJr0QJ38kVleCo+2wVDLs2/EWC01SN24yzE6ervWp+zGJ7XLvY8d0MQZ6c1ycmeBIXUxNQd8KMRtNwGobtmsl3s8kW2RlPzpcyHbMCzTyWhgLNg3mMbQpd/2XUMQf++jHNt3zyc+x7Y+HqB5Fqs= rsa-key-20011102-pchapman',
      'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEA5IXq9kQQYtY9uw0hKEuTKhBrQu+Xld+V9ez5XJ3DyogsakkzyLL/X4Lp69yXL3PL86jsl1aXpiex0FyGLKTwUUgYk4k//oXRhdL159JuPgvmgBC8nWNbaTgOl0ElsVtKdF+fKH/dyXI9o42keZ9abk5nzPDJr0IyPDyKcBd7sYM= pchapman@stove.infoplease.com',
      'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAhAOgjAjBw3IQnIB76tQdWFBfw5NU9al2fGE2ms1YrH1TYfj8pcP/hjz3rMTcDd4SmfIcqhBgJTFd0b9fNbVP7MIbGGl04+GndTwUL3Wo8iSL4DmGfIjHCq7nID2cUAZk4rrcyeXHKgMKvSdbNRf7v+WSSlDXe8tFgZ/kXX7q9tU= rsa-key-20011213-pchapman'
    ]
  },
  {
    'name' => 'udeanju',
    'uid' => 12008,
    'gid' => 12008,
    'authorized_keys' => [
      'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEAtppdsJFf/Wrrs7bJ1TIsCGdFt02UYccatlBT0xeHG08JeFt2GwvXTKHQKLXgcgCB3w+F2QaATqLt7TmifXhLKW8DPQ7OcnwY/Az2mCDyUl3Sj/I6ZIADZe/5ojXvXGIMqQh+3xdmdKFTbrI+s3J9cK6KzH0UKOfI1ousGNpQ/ns= rsa-key-20100209-udeanju'
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