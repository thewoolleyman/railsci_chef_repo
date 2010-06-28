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

include_recipe "java"

unless File.exists?("/tmp/TeamCity-5.1.2.tar.gz")
  remote_file "/tmp/TeamCity-5.1.2.tar.gz" do
    source "http://download.jetbrains.com/teamcity/TeamCity-5.1.2.tar.gz"
    mode 0644
  end
end

unless File.exists?("#{node[:teamcity][:install_path]}/TeamCity")
  execute "tar zxf /tmp/TeamCity-5.1.2.tar.gz" do
    cwd node[:teamcity][:install_path]
  end
end

bash "install_teamcity" do
  code <<-EOH
  chown -R #{node[:teamcity][:user]}:#{node[:teamcity][:user]} #{node[:teamcity][:install_path]}
  EOH
end

if node[:platform] =~ /ubuntu/i
  execute "start-teamcity-server" do
    command "start teamcity-server"
    action :nothing
  end

  template "/etc/init/teamcity-server.conf" do
    source "teamcity-server.conf.erb"
    mode 0644
    notifies :run, resources(:execute => "start-teamcity-server"), :immediately
  end

  execute "start-teamcity-agent" do
    command "start teamcity-agent"
    action :nothing
  end

  template "/etc/init/teamcity-agent.conf" do
    source "teamcity-agent.conf.erb"
    mode 0644
    notifies :run, resources(:execute => "start-teamcity-agent"), :immediately
  end
end
