#
# Cookbook Name:: railsci_post_setup
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

# Make a symlink to current java home.  Asked on chef-dev list what is correct way to handle this...
link "/usr/lib/jvm/java" do
  to "/usr/lib/jvm/java-6-sun"
end

directory "/home/#{node['teamcity']['user']}/.BuildServer" do
  mode 0755
  action :create
  owner node['teamcity']['user']
  group node['teamcity']['user']
end

directory "/home/#{node['teamcity']['user']}/.BuildServer/config" do
  mode 0755
  action :create
  owner node['teamcity']['user']
  group node['teamcity']['user']
end

directory "/home/#{node['teamcity']['user']}/.BuildServer/config/rails" do
  mode 0755
  action :create
  owner node['teamcity']['user']
  group node['teamcity']['user']
end

remote_file "/home/#{node['teamcity']['user']}/.BuildServer/config/vcs-roots.xml" do
  source "BuildServer/config/vcs-roots.xml"
  mode 0644
  owner node['teamcity']['user']
  group node['teamcity']['user']
end

remote_file "/home/#{node['teamcity']['user']}/.BuildServer/config/rails/plugin-settings.xml" do
  source "BuildServer/config/rails/plugin-settings.xml"
  mode 0644
  owner node['teamcity']['user']
  group node['teamcity']['user']
end

remote_file "/home/#{node['teamcity']['user']}/.BuildServer/config/rails/project-config.xml" do
  source "BuildServer/config/rails/project-config.xml"
  mode 0644
  owner node['teamcity']['user']
  group node['teamcity']['user']
end

