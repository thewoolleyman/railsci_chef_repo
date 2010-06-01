#
# Cookbook Name:: teamcity
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
java_sun
tomcat6
}.each do |recipe|
  include_recipe recipe
end


remote_file "#{@node[:tomcat6][:webapps]}/TeamCity-5.1.2.war" do
  source "http://download.jetbrains.com/teamcity/TeamCity-5.1.2.war"
  mode 0644
  owner "root"
  group "root"
  not_if { ::FileTest.exists?("#{@node[:tomcat6][:webapps]}/TeamCity-5.1.2.war") }
end

