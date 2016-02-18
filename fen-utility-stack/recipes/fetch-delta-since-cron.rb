#
# Cookbook Name:: fen-utility-stack
# Recipe:: fetch-delta-since
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

cron_d "pop-update-entitlement.cron" do
  user node['apache']['user']
  minute '0'
  command '/usr/bin/php -d auto_prepend_file=/site/cfg/prepend-tv.php /site/bin/pop-update-entitlement.php -a -q'
  cookbook 'cron'
  mailto 'poptropica-membership@alert.fen.com'
end

cron_d "pop-sync-entitlement-log.cron" do
  user node['apache']['user']
  minute '0'
  hour '0'
  command '/usr/bin/php -d auto_prepend_file=/site/cfg/prepend-tv.php /site/bin/pop-sync-entitlement-log.php'
  cookbook 'cron'
  mailto 'poptropica-membership@alert.fen.com'
end

cron_d "tv-process-entitlement-log.cron" do
  user node['apache']['user']
  minute '0'
  hour '0'
  command '/usr/bin/php -d auto_prepend_file=/site/cfg/prepend-tv.php /site/bin/tv-process-entitlement-log.php'
  cookbook 'cron'
  mailto 'poptropica-membership@alert.fen.com'
end

cron_d "tv-update-entitlement.cron" do
  user node['apache']['user']
  minute '0'
  hour '0'
  command '/usr/bin/php -d auto_prepend_file=/site/cfg/prepend-tv.php -d auto_prepend_file=/site/cfg/prepend-tv.php /site/bin/tv-update-entitlement.php -q -v -a'
  cookbook 'cron'
  mailto 'poptropica-membership@alert.fen.com'
end

cron_d "pop-process-refunds-dev.cron" do
  user 'root'
  minute '0'
  command '/usr/bin/php -d auto_prepend_file=/site/cfg/prepend-tv.php -d auto_prepend_file=/site/cfg/prepend-tv.php /site/bin/pop-process-refunds.php -q -v -m dev'
  cookbook 'cron'
  mailto 'poptropica-membership@alert.fen.com'
end

cron_d "pop-process-refunds-live.cron" do
  user 'root'
  minute '0'
  command '/usr/bin/php -d auto_prepend_file=/site/cfg/prepend-tv.php -d auto_prepend_file=/site/cfg/prepend-tv.php /site/bin/pop-process-refunds.php -q -v -m live'
  cookbook 'cron'
  mailto 'poptropica-membership@alert.fen.com'
end

cron_d "tv-process-refunds-dev.cron" do
  user 'root'
  minute '0'
  command '/usr/bin/php -d auto_prepend_file=/site/cfg/prepend-tv.php -d auto_prepend_file=/site/cfg/prepend-tv.php /site/bin/tv-process-refunds.php -q -v -m dev_TV_prodtest'
  cookbook 'cron'
  mailto 'poptropica-membership@alert.fen.com'
end

cron_d "tv-process-refunds-live.cron" do
  user 'root'
  minute '0'
  command '/usr/bin/php -d auto_prepend_file=/site/cfg/prepend-tv.php -d auto_prepend_file=/site/cfg/prepend-tv.php /site/bin/tv-process-refunds.php -q -v -m live_TV_production'
  cookbook 'cron'
  mailto 'poptropica-membership@alert.fen.com'
end

cron_d "tv-delete-vindicia-sync-logs.cron" do
  user 'root'
  minute '0'
  hour '0'
  command '/usr/bin/find /var/log/vindicia/sync/teachervision -type f -mtime +95 -delete'
  cookbook 'cron'
  mailto 'poptropica-membership@alert.fen.com'
end

cron_d "delete-vindicia-sync-logs.cron" do
  user 'root'
  minute '0'
  hour '0'
  command '/usr/bin/find /var/log/vindicia/sync/ -type f -mtime +95 -delete'
  cookbook 'cron'
  mailto 'poptropica-membership@alert.fen.com'
end

cron_d "delete-poptropica-refund-logs.cron" do
  user 'root'
  minute '0'
  hour '0'
  command '/usr/bin/find /var/log/vindicia/sync/refunds/poptropica -type f -mtime +95 -delete'
  cookbook 'cron'
  mailto 'poptropica-membership@alert.fen.com'
end