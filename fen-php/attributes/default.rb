#
# Cookbook Name:: fen-php
# Attribute File:: default
#
# Copyright 2015, FEN
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#default['php']['include_path']

default['php']['include_path'] = %w[/site/vendor /site/lib /site/html /usr/share/pear /usr/share/php]

default['php']['modules'] = {
  'php5-apcu' => true,
  'php5-curl' => true, 
  'php5-gd' => true, 
  'php5-geoip' => true,
  'php5-gmp' => true, 
  'php5-imap' => true,
  'php5-intl' => true,
  'php5-ldap' => true, 
  'php5-memcache' => true, 
  'php5-mcrypt' => true,
  'php5-mhash' => true,
  'php5-mongo' => true,
  'php5-mysql' => true,
  'php5-pgsql' => true,
  'php5-pspell' => true,
  'php5-sqlite' => true,
  'php5-xdebug' => false,
  'php5-xhprof' => false
}

default['php']['directives']['date.timezone'] = 'UTC'
default['php']['directives']['short_open_tag'] = 'Off'
if (node['fen']['sitevars']['global']['DEV'].nil? || node['fen']['sitevars']['global']['DEV'] == 0)
  default['php']['directives']['error_reporting'] = 'E_ALL & ~E_DEPRECATED & ~E_NOTICE'
else
  default['php']['directives']['error_reporting'] = 'E_ALL & ~E_NOTICE & ~E_DEPRECATED'
end

default['php']['apache2']['conf_dir'] = `dirname #{node['php']['conf_dir']}`.strip + '/apache2'

  # Set up configurations for Zend OpCache
default['php']['config']['opcache']['config_file'] = "#{node['php']['apache2']['conf_dir']}/conf.d/05-opcache.ini"
default['php']['config']['opcache']['template'] = 'opcache.ini.erb'
default['php']['config']['opcache']['conf'] = {
  'enable' => 1,
  'enable_cli' => 1,
  'opcache.validate_timestamps' => 5,
  'opcache.use_cwd' => 1,
  'opcache.memory_consumption' => 128,
  'opcache.max_accelerated_files' => 2500,
  'opcache.interned_strings_buffer' => 8,
  'opcache.revalidate_freq' => 60,
  'opcache.fast_shutdown' => 1
}
  
# Set up configurations for APCu
default['php']['config']['php5-apcu']['config_file'] = "#{node['php']['apache2']['conf_dir']}/conf.d/20-apcu.ini"
default['php']['config']['php5-apcu']['template'] = 'apcu.ini.erb'
default['php']['config']['php5-apcu']['conf'] = {
  'apc.enabled' => 1,
  'apc.shm_size' => '512M',
  'apc.ttl' => 60,
  'apc.user_ttl' => 60,
  'apc.gc_ttl' => 60,
  'apc.enable_cli' => 1,
  'apc.num_files_hint' => 10000
}

