accounts = [
  {
    'name' => 'dbhushan',
    'uid' => 12101,
    'gid' => 12101,
    'authorized_keys' => ['ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINftiyAULC8JbbaPx/Bl7R3OjBDOm5kvQ01OI34QFx2N divyanshubhushan@ip-10-50-1-77.ec2.internal'] 
  },
  {
    'name' => 'sunniya',
    'uid' => 12102,
    'gid' => 12102,
    'authorized_keys' => ['ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAgEAhDNq/8DEo1bykcaQdr2GIYLKBozpD8POd/ALgVu7eMG90zXIwHk4p9VlHB9qIJTCo3kEnUySxFc4mMIpuA8WGbHomAd0y72yXC/p4xzoDOohDcyr0WIoV154FcuDPGiKN0wg1HLPdSn5qZUCerddy15b7bbaSQEpl1DiE96MlveXn7yAnXqXkS76+hwMVVBfI5qQ9d2ZmV3iPjSXH/rYc9ti2yNpl+ucd8y+nD/90jSzb5upD2ItpNEHRQWRWrs84YeasoJv+dpCDcyByegSbwRWkwguTWaXIiClWGx1Oirx5YFD4b8DvsJFw8jKHFuFjmZfznBUZ16Q4hOd3nIHLnFomGEEGfJCT/1NU8P1/TLdGU2FKGKN/KCPeBAhlQNI17b677+6mZZOqWmJyOBsfqTyomfhGXjnzSoToTkGbP+c+lFYBFdVtw3wMM/O6sdkatJnBD5zoJ4tamVd264vYGpBZKUVoTIlrPa24hK7cLzvyW7bzGpdZYOOnAtpOFEx8z5eXowPE6dCORhiGSaUsAwtx78FHVQijVmiWCtnqmVhFTFdwTPKlWe70wAHppjFGe0g/h5oDIzO49HwgAfJ7kNEK27IcNdZT/nsbCUnkiu/gkktJxajn7ZG5OnHm2c96m22myB97efCBNV6YfiZ74Qvn8ZffWKl7G5A9axc0GU= rsa-key-20160126-sunniya']
  }
]

accounts.each do |local_account|
  fen_local_accounts_account local_account['name'] do
    uid local_account['uid']
    gid local_account['gid']
    authorized_keys local_account['authorized_keys']
  end
  `usermod -G www-data #{local_account['name']}`
end