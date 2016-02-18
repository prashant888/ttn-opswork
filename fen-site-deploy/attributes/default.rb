#
# Cookbook Name:: fen-site-deploy
# Attributes:: default
#

default['fen']['site']['directories'] = %w[bin cache cgi-bin data html images lib vendor]
default['fen']['site']['sitegroup'] = 'reference'

default['fen']['site']['deploy']['owner'] = 'root'
default['fen']['site']['deploy']['group'] = 'root'

default['fen']['site']['deploy']['server'] = 'nfs1.fen.com'
default['fen']['site']['deploy']['user'] = 'filecopy'
default['fen']['site']['deploy']['path'] = '/srv/nfs/staging'
default['fen']['site']['deploy']['nfspath'] = '/mnt/staging'

default['fen']['site']['deploy']['command'] = '/usr/bin/rsync'
default['fen']['site']['deploy']['flags'] = '-a --size-only --numeric-ids --inplace -W'
default['fen']['site']['deploy']['origin'] = "#{node['fen']['site']['deploy']['server']}:#{node['fen']['site']['deploy']['path']}"