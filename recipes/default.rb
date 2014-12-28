#
# Cookbook Name:: ud-cactiserver
# Recipe:: default
#
# Copyright 2014, Urbandecoder Labs LLC
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

httpd_service 'default' do
  action :create
end

httpd_module 'ssl' do
  action :create
end

httpd_module 'socache_shmcb' do
  action :create
end

httpd_config 'ssl_config' do
  config_name 'ssl'
  source 'mod_ssl.conf.erb'
  action :create
end

httpd_module 'security2' do
  package_name 'mod_security' # XXX work around silly bugs
  action :create
end

# required by mod_security
httpd_module 'unique_id' do
  action :create
end

httpd_config 'security_config' do
  config_name 'mod_security'
  source 'mod_security.conf.erb'
  action :create
end
