cron_d 'widget_targeting' do
  user node['apache']['user']
  minute '0'
  hour '*'
  command 'php -d auto_prepend_file=/site/cfg/prepend.php /site/lib/tv/create_widget_targeting_cache.php fn > /tmp/create_widget_targeting_cache.php.out 2>&1;/site/bin/tv-clear-cache wid_cache > /tmp/clear_wid_cache.out 2>&1;'
  cookbook 'cron'
  mailto 'system-alerts-learning@fen.com'
end
