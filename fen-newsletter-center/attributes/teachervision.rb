#
# Cookbook Name:: fen-newsletter-center
# Attribute File:: teachervision
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

# Database config  
default['web_app']['teachervision']['database']['name'] = 'drupal7_newsletters_tv'
default['web_app']['teachervision']['database']['user'] = 'drupal'
default['web_app']['teachervision']['database']['password'] = 'dfraump3ad1'
default['web_app']['teachervision']['database']['host'] = 'ip-10-0-4-111.ec2.internal'
default['web_app']['teachervision']['server_name'] = 'newsletters.teachervision.com'
default['web_app']['teachervision']['rabbitmq_prefix'] = 'tv-'
default['web_app']['teachervision']['drupal_hash_salt'] = '83o8CVQH2_x3PyHhmTNSOeGT_Xi9eI1EXakuee88c3g'
default['web_app']['teachervision']['drupal_cron_key'] = '-Dv4L1_3pTG4aKPVbzdeG-Dd2n-ExuaZtXVvnHjLItY'