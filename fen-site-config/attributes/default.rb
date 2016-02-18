#
# Cookbook Name:: fen-site-config
# Attributes:: default
#
# Copyright 2015, FEN
#
# All rights reserved - Do Not Redistribute
#

default['apache']['user'] = 'www-data'
default['apache']['group'] = 'www-data'

default['fen']['config_dir'] = '/site/cfg'
  
# Set the legacy $IP_* global variables
default['fen']['sitevars']['legacy']['ip_html_dir'] = '/site/html'
default['fen']['sitevars']['legacy']['ip_lib_dir'] = '/site/lib'
default['fen']['sitevars']['legacy']['ip_html_host'] = 'localhost'
default['fen']['sitevars']['legacy']['ip_image_host'] = 'i.infopls.com'
default['fen']['sitevars']['legacy']['ip_script_host'] = 'localhost'
default['fen']['sitevars']['legacy']['ip_search_host'] = node['fqdn'] 
default['fen']['sitevars']['legacy']['ip_query_host'] = node['fqdn'] 
default['fen']['sitevars']['legacy']['ip_db_host'] = 'localhost'  
default['fen']['sitevars']['legacy']['ip_dbro_host'] = 'localhost'
default['fen']['sitevars']['legacy']['ip_db_id_host'] = 'localhost'
default['fen']['sitevars']['legacy']['ip_db_tv_host'] = 'localhost'
default['fen']['sitevars']['legacy']['ip_db_maps_host'] = 'localhost'
default['fen']['sitevars']['legacy']['ip_tv_html_host'] = 'www.teachervison.com'
default['fen']['sitevars']['legacy']['ip_db_fb_host'] = 'localhost'
default['fen']['sitevars']['legacy']['ip_db_fb_track_host'] = 'localhost'
default['fen']['sitevars']['legacy']['ip_db_data_host'] = 'localhost'
default['fen']['sitevars']['legacy']['ip_db_pop_host'] = 'localhost'

# Set variables in LocalVars
default['fen']['sitevars']['global'] = {
  'IMAP_SERVER'  => %w[alert.fen.com],
  'IMAP_USER'    => %w[unittest],
  'HTML_HOST'    => node['fqdn'],
  'IMAGE_HOST'   => node['fen']['sitevars']['legacy']['ip_image_host'],
  'SCRIPT_HOST'  => node['fqdn'],
  'SEARCH_HOST'  => node['fqdn'],
  'QUERY_HOST'   => node['fqdn'],
  'DB_HOST'      => node['fen']['sitevars']['legacy']['ip_db_host'],
  'DBRO_HOST'    => node['fen']['sitevars']['legacy']['ip_dbro_host'],
  'DB_ID_HOST'   => node['fen']['sitevars']['legacy']['ip_db_id_host'],
  'DB_TV_HOST'   => node['fqdn'],
  'DB_MAPS_HOST' => node['fqdn'],
  'TV_HTML_HOST' => node['fqdn'],
  'FB_DATA_HOST' => node['fqdn'],
  'SMTP_GATEWAY' => node['fqdn'],
  'GEOIP_DATA_DIR'     => '/usr/share/GeoIP',
  'DEV'                => 1,
  'BRAINTRACK_DB_HOST' =>  node['fqdn'],
  'DB_QUERY_LOG'       => %w[:::],
  'SOLR_HOST'          => node['fqdn'],
  'SOLR_PORT'          => '8080',
  'SOLR_PATH'          => '/solr',
  'SOLR_CORE'          => 'fen',
  'SOLR_COLLAPSE_SINGLE_VALUE_ARRAYS' => 1,
  'SOLR_RESULTS_PER_PAGE'             => 20,
  'SOLR_EXCLUDE_TYPES'                => %w[callout dailyteach e-card feature literature-tie-in newsletter pregnancy-nl provider teacher-bookshelf web-resource],
}