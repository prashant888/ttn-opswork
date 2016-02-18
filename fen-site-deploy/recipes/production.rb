#
# Cookbook Name:: fen-site-deploy
# Recipe:: production
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'fen-site-deploy::default'

cron_d "syncpull0" do
  minute '*/5'
  command "flock -nx /var/lock/syncpull0.lock -c '/site/bin/syncpull.pl --sleep 30 --ssh --host nfs1.fen.com --site-group #{node['fen']['site']['sitegroup']} --source-root /srv/nfs/staging  /site/lib'"
  cookbook 'cron'
  user node['apache']['user']
  mailto 'system-alerts-learning@fen.com'
end

cron_d "syncpull1" do
  minute '*/5'
  command "flock -nx /var/lock/syncpull1.lock -c '/site/bin/syncpull.pl --sleep 30 --ssh --host nfs1.fen.com --site-group #{node['fen']['site']['sitegroup']} --source-root /srv/nfs/staging /site/bin'"
  cookbook 'cron'
  user node['apache']['user']
  mailto 'system-alerts-learning@fen.com'
end

cron_d "syncpull2" do
  minute '*/5'
  command "flock -nx /var/lock/syncpull2.lock -c '/site/bin/syncpull.pl --sleep 30 --ssh --host nfs1.fen.com --site-group #{node['fen']['site']['sitegroup']} --source-root /srv/nfs/staging /site/html'"
  cookbook 'cron'
  user node['apache']['user']
  mailto 'system-alerts-learning@fen.com'
end

cron_d "syncpull3" do
  minute '*/5'
  command "flock -nx /var/lock/syncpull3.lock -c '/site/bin/syncpull.pl --sleep 30 --ssh --host nfs1.fen.com --site-group #{node['fen']['site']['sitegroup']} --source-root /srv/nfs/staging /site/data'"
  cookbook 'cron'
  user node['apache']['user']
  mailto 'system-alerts-learning@fen.com'
end

