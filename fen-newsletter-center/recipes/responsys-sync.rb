#
# Cookbook Name:: fen-newsletter-center
# Recipe:: responsys-sync
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

## TODO - set up supervisord workers

## TODO - set up rabbitmq

sites = %W{fe tv}

sites.each do |site|
  # Set up the sync alert scripts
  cron_d "responsys-sync-alert-#{site}.cron" do
    minute '0'
    hour '3,15'
    command "/usr/bin/php /var/www/newsletters/sites/all/libraries/sync_alert.php #{site}"
    cookbook 'cron'
    user node['apache']['user']
    mailto 'erich.beyrent@fen.com'
  end
  
  # Set up the non_responders alert scripts
  cron_d "non-responders-alert-#{site}.cron" do
    minute '0'
    hour '5'
    command "/usr/bin/php /var/www/newsletters/sites/all/libraries/non_responders.php #{site}"
    cookbook 'cron'
    user node['apache']['user']
    mailto 'erich.beyrent@fen.com'
  end
end