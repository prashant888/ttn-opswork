#
# Cookbook Name:: fen-newsletter-center
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

default['web_app']['repository'] = 'ssh://git@vc.fen.com/newsletters'
default['web_app']['branch'] = 'maint'
default['web_app']['deploy_dir'] = '/var/www/html/newsletters'
  
# PHP config
default['web_app']['php']['memory_limit'] = '128M'  
 