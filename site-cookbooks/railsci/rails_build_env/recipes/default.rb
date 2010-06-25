#
# Cookbook Name:: rails_build_env
# Recipe:: default
#
# Copyright 2010, Chad Woolley
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

%w{ 
memcached
mysql
postgres
java
}.each do |recipe|
  include_recipe recipe
end


%w{
build-essential
libfcgi-dev
libreadline5-dev
libsqlite0-dev
libsqlite3-dev
libxml2
libxml2-dev
libxslt1-dev
postgresql-server-dev-8.4
sqlite
zlib1g-dev
}.each do |pkg|
  package pkg do
      action :install
  end
end

