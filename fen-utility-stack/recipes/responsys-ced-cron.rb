#
# Cookbook Name:: fen-utility-stack
# Recipe:: responsys-ced-cron
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

cron_d "responsys_fetch_ced_files.cron" do
  user 'root'
  minute '0'
  hour '10'
  command '/usr/bin/php -d auto_prepend_file=/site/cfg/prepend-tv.php /site/bin/responsys/responsys_fetch_ced_files.php'
  cookbook 'cron'
  mailto 'poptropica-membership@alert.fen.com'
end

cron_d "responsys_fetch_ced_files.cron" do
  user 'root'
  minute '0'
  hour '12'
  command '/usr/bin/php -d auto_prepend_file=/site/cfg/prepend-tv.php /site/bin/responsys/responsys_fetch_ced_files.php'
  cookbook 'cron'
  mailto 'poptropica-membership@alert.fen.com'
end

cron_d "purge-password-list.cron" do
  user 'webadmin'
  minute '0'
  hour '16'
  command '/usr/bin/php -d auto_prepend_file=/site/cfg/prepend-tv.php /site/bin/responsys/purge-password-list.php'
  cookbook 'cron'
  mailto 'poptropica-membership@alert.fen.com'
end

cron_d "responsys_ced_processor_report.cron" do
  user 'root'
  minute '0'
  hour '23'
  command '/usr/bin/php -d auto_prepend_file=/site/cfg/prepend-tv.php /site/bin/responsys/responsys_ced_processor_report.php'
  cookbook 'cron'
  mailto 'poptropica-membership@alert.fen.com'
end

cron_d "delete-responsys-logs.cron" do
  user 'root'
  minute '0'
  hour '0'
  command '/usr/bin/find /var/log/responsys/ -type f -mtime +7 -delete'
  cookbook 'cron'
  mailto 'poptropica-membership@alert.fen.com'
end

cron_d "delete-responsys-pending-files.cron" do
  user 'root'
  minute '0'
  hour '2'
  command '/usr/bin/find /var/tmp/responsys/pending/ -type f -mtime +7 -delete'
  cookbook 'cron'
  mailto 'poptropica-membership@alert.fen.com'
end

cron_d "delete-responsys-processed-files.cron" do
  user 'root'
  minute '0'
  hour '2'
  command '/usr/bin/find /var/tmp/responsys/processed/ -type f -mtime +7 -delete'
  cookbook 'cron'
  mailto 'poptropica-membership@alert.fen.com'
end