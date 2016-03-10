#
# Author:: Seth Chisamore (<schisamo@opscode.com>)
# Cookbook Name:: iis
# Recipe:: default
#
# Copyright 2011, Opscode, Inc.
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

include_recipe "webpi"

webpi_product node['iis']['components'] do
  accept_eula node['iis']['accept_eula']
  action :install
end

service "iis" do
  service_name "W3SVC"
  action :nothing
end