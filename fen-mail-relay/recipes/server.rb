#
# Cookbook Name:: fen-mail-relay
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'fen-aws::globalops'
include_recipe 'fen-ssl::fen'

node.override['postfix']['mail_type'] = 'master'
node.override['postfix']['use_procmail'] = false

node.override['postfix']['use_alias_maps'] = true
node.override['postfix']['use_transport_maps'] = true
node.override['postfix']['use_access_maps'] = false
node.override['postfix']['use_virtual_aliases'] = true

node.override['postfix']['aliases'] = {
  'kevin' => ['kevin.wong@fen.com'],
  # Probably superseded by aws-admin@fen.com, but keep this around for a little while to be sure (2015-01-13)
  'aws' => ['dan.franklin@fen.com', 'chris.messner@fen.com', 'kevin.wong@fen.com'],

  # live server root crontab uses this
  'root-cron' => ['karl.debisschop@fen.com', 'kevin.wong@fen.com'],
  # Backup script uses this
  'backup' => ['karl.debisschop@fen.com', 'kevin.wong@fen.com', 'dan.franklin@fen.com'],
  # Geoip update script uses this
  'geoip-cron' => ['karl.debisschop@fen.com', 'kevin.wong@fen.com', 'dan.franklin@fen.com'],
  # live server webadmin crontabs use these
  'webadmin-cron' => ['karl.debisschop@fen.com', 'kevin.wong@fen.com', 'benny.joseph@fen.com', 'dan.franklin@fen.com'],
  'webadmin-ip-cron' => ['karl.debisschop@fen.com'],
  'webadmin-tv-cron' => ['kevin.wong@fen.com'],
  # tv-ecard-stats script uses this
  'tv-ecard-stats' => ['amy.deaner@fen.com'],
  # tv-list-untagged script uses this
  'tv-list-untagged' => ['holly.miller@fen.com', 'amy.deaner@fen.com', 'Emily.lalka@fen.com', 'julie.deaner@fen.com'],
  'tv-list-pending-fe' => ['lindsay.hutton@fen.com'],
  'tv-list-pending-tv' => ['holly.miller@fen.com', 'amy.deaner@fen.com', 'Emily.lalka@fen.com'],
  # tvdb-regen.cron uses this
  'tvdb-regen-cron' => ['kevin.wong@fen.com'],
  # tvdb.cron uses this
  'tvdb-cron' => ['kevin.wong@fen.com', 'karl.debisschop@fen.com'],
  # TV Printable/Quiz Registration Page report (tv-reg-report script, not currently used)
  'tv-reg-report' => ['kevin.wong@fen.com', 'kim.regan@fen.com'],

  # expired bookshelf pages
  'list-expired-bookshelf-providers' => ['benny.joseph@fen.com'],
  # activate/expire page mails
  'expire-activate-content' => ['benny.joseph@fen.com', 'cara.finnegan@fen.com'],
  # Expired Themes report goes to this
  'tv-expired-themes' => ['amy.deaner@fen.com', 'lindsay.hutton@fen.com'],
  'theme-date' => ['benny.joseph@fen.com'],
  # Alternative-page management
  'tv-alternatives' => ['amy.deaner@fen.com', 'benny.joseph@fen.com', 'julie.deaner@fen.com', 'holly.miller@fen.com'],
  # swap alternatives notification
  'swap-alternatives' => ['benny.joseph@fen.com'],
  #source-page-notifications
  'source-page-notifications' => ['benny.joseph@fen.com'],
  # Content update notifications for FE and TV.  Editors enter this in the content notification
  # database email address field.
  'content-update-notifications' => ['Amy.deaner@fen.com', 'cara.finnegan@fen.com', 'emily.lalka@fen.com', 'beth.rowen@fen.com', 'holly.poulos@fen.com'],
  'content-notifications' => ['content-update-notifications@localhost'],
  # update backlinks
  'update-backlinks' => ['benny.joseph@fen.com'],

  # TV RSS "feed" for learnreturn.com (Liberty Mutual)
  'tv-rss' => ['benny.joseph@fen.com'],

  # For the upload tool
  'upload_spreadsheet_user' => ['benny.joseph@fen.com', 'julie.deaner@fen.com', 'emily.lalka@fen.com', 'lindsay.hutton@fen.com', 'amy.deaner@fen.com', 'erin.dower@fen.com', 'cara.finnegan@fen.com', 'holly.poulos@fen.com'],
  'upload_spreadsheet_admin' => ['benny.joseph@fen.com'],

  # For broken link reports (dfranklin crontab on flare)
  'tv-broken-links' => ['holly.miller@fen.com', 'amy.deaner@fen.com', 'Emily.lalka@fen.com', 'kevin.wong@fen.com'],
  'fe-broken-links' => ['lindsay.hutton@fen.com', 'kevin.wong@fen.com'],
  'fb-broken-links' => ['dan.franklin@fen.com', 'jeff.faulconer@fen.com', 'paul.chapman@fen.com', 'kevin.wong@fen.com'],

  # Users reporting spam on drupal sites
  'drupal-spam' => ['martibs@aol.com', 'cara.finnegan@fen.com', 'mitchell.krpata@fen.com'],

  # Nightly logfile analysis on lin172
  'nightly-loganalysis' => ['karl.debisschop@fen.com', 'kevin.wong@fen.com'],

  # Sitescope account uses this in .forward
  'sitescope' => ['chris.messner@fen.com', 'dan.franklin@fen.com'],

  # Funbrain & Poptropica scripts
  'funbrain-root' => ['kevin.wong@fen.com', 'dan.franklin@fen.com'],
  'funbrain-tracking' => ['kevin.wong@fen.com', 'dan.franklin@fen.com'],
  'funbrain-health' => ['kevin.wong@fen.com', 'dan.franklin@fen.com', 'paul.chapman@fen.com'],
  'funbrain-critical' => ['funbrain-health@localhost', 'dfranklin-cell@localhost', 'system-alerts@fen.com'],
  'funbrain-house-ads' => ['colleen.shea@fen.com', 'kevin.wong@fen.com', 'dan.franklin@fen.com', 'jeff.faulconer@fen.com'],

  'chrisbarney' => ['chris.barney@fen.com'],

  'poptropica-mmo' => ['dan.franklin@fen.com', 'kevin.wong@fen.com', 'chrisbarney@localhost'],
  'poptropica-tracking' => ['kevin.wong@fen.com', 'dan.franklin@fen.com'],
  'poptropica-health' => ['kevin.wong@fen.com', 'dan.franklin@fen.com', 'paul.chapman@fen.com', 'chrisbarney@localhost', 'benny.joseph@fen.com'],
  'poptropica-membership' => ['system-alerts@fen.com', 'dan.franklin@fen.com', 'karl.debisschop@fen.com'],
  'poptropica-404s' => ['poptropica-health@localhost', 'poptropica-code@fen.com'],
  'poptropica-dev-404s' => ['dan.franklin@fen.com', 'chrisbarney@localhost', 'kyle.miller@fen.com', 'rick.hocker@fen.com', 'john.d.kilby@fen.com'],
  'poptropica-critical' => ['poptropica-health@localhost', 'dfranklin-cell@localhost', 'chrisbarney-cell@localhost', 'system-alerts@fen.com'],
  'poptropica-auto-tests' => ['chrisbarney@localhost', 'dan.franklin@fen.com', 'karl.debisschop@fen.com', 'benny.joseph@fen.com'],
  'poptropica-server-code' => ['dan.franklin@fen.com', 'chris.barney@fen.com', 'rich.martin@fen.com', 'benny.joseph@fen.com', 'paul.chapman@fen.com', 'rick.hocker@fen.com', 'karl.debisschop@fen.com', 'julie.deaner@fen.com'],

  # publish_items changes go to these people.
  'poptropica-auto-publish' => ['jonathan.pitcher@fen.com', 'colleen.angelopolus@fen.com', 'john.d.kilby@fen.com', 'kyle.miller@fen.com', 'rick.hocker@fen.com', 'dan.franklin@fen.com'],

  'amazon-ec2-root' => ['dan.franklin@fen.com', 'kevin.wong@fen.com'],

  # PHP testing
  'site-lib-auto-tests' => ['dan.franklin@fen.com', 'karl.debisschop@fen.com'],

  'pop-dev-slave-db' => ['dan.franklin@fen.com', 'kevin.wong@fen.com', 'karl.debisschop@fen.com', 'chris.barney@fen.com'],

  ###
  ### Additional personal aliases
  ###

  'dfranklin' => ['dan.franklin@fen.com'],
  'dan.franklin' => ['dan.franklin@fen.com'],
  'dfranklin-cell' => ['7817180857@txt.att.net'],
  'chrisbarney-cell' => ['6179397868@txt.att.net'],
  'chrisbarney-personal' => ['ryha2000@gmail.com'],

  # For testing
  'rightnow.test' => ['poptropica@mailca.custhelp.com', 'andrew.lee@fen.com'],

  # dev server cron job uses this
  'dev-cron' => ['benny.joseph@fen.com'],

  'anonymous' => ['/dev/null'],

  # Do we still use this?
  # vindicia: "| /site/bin/queue_vindicia_message.php"

  'phpdevs' => ['dfranklin@localhost', 'ubarnch@localhost', 'ujosebe@localhost', 'udebika@localhost'],
  'scmadm' => ['udebika@localhost', 'dfranklin@localhost'],
  'amazon.store' => ['chris.messner@fen.com', 'kim.regan@fen.com', 'karl.debisschop@fen.com', 'jennifer.wood@fen.com'],
}

node.override['postfix']['transports'] = {
    'example.com' => 'discard'
}

instance = search("aws_opsworks_instance", "self:true").first
node.override['postfix']['main']['mydestination'] = <<eos
localhost localdomain localhost.localdomain
  #{instance[:hostname]}
  #{instance[:hostname]}.localdomain
  #{instance[:hostname]}.localdomain.#{node['postfix']['main']['mydomain']}
  #{instance[:hostname]}.#{node['postfix']['main']['mydomain']}
  localhost.#{node['postfix']['main']['mydomain']}
eos
node.override['postfix']['main']['mynetworks'] = '10.0.0.0/16 127.0.0.0/8 64.124.35.206/32 64.81.252.14/32 [::ffff:127.0.0.0]/104 [::1]/128'
node.override['postfix']['main']['inet_interfaces'] = 'all'

node.override['postfix']['main']['masquerade_domains'] = 'infopls.com'

node.override['postfix']['main']['local_header_rewrite_clients'] = 'permit_inet_interfaces permit_mynetworks'
node.override['postfix']['sender_canonical_map_entries'] = {
  'ubeyrer' => 'erich.beyrent@fen.com',
  'udebika' => 'karl.debisschop@fen.com',
  'ufrand3' => 'dan.franklin@fen.com',
  'umessch' => 'chris.messner@fen.com',
  'uwongke' => 'kevin.wong@fen.com'
}

node.override['postfix']['use_relay_restrictions_maps'] = true
node.override['postfix']['relay_restrictions'] = {
  '64.124.35.206' => 'OK',
  '64.81.252.14' => 'OK',
  'em01.merchants.sj.vindicia.com' => 'OK',
  'em02.merchants.sj.vindicia.com' => 'OK'
}

# node.override['postfix']['virtual_aliases'] = {
#     'udebika' => 'karl.debisschop@fen.com',
#     'ufrand3' => 'dan.franklin@fen.com',
#     'uwongke' => 'kevin.wong@fen.com'
# }

cert_domain = 'star.fen.com'
node.override['postfix']['main']['smtpd_use_tls'] = 'yes'
node.override['postfix']['main']['smtpd_tls_cert_file'] = "#{node['fen-ssl']['ssl_cert_dir']}/#{cert_domain}.crt"
node.override['postfix']['main']['smtpd_tls_key_file'] = "#{node['fen-ssl']['ssl_key_dir']}/#{cert_domain}.key"
node.override['postfix']['main']['smtpd_tls_CAfile'] = "#{node['fen-ssl']['ssl_cert_dir']}/csc_bundle.crt"

include_recipe 'postfix'
