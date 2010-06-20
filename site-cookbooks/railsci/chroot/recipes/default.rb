#
# Cookbook Name:: chroot
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

if node[:chroot].to_s == 'true'
  collection.all_resources.each do |resource|
    [
      "template[/etc/mysql/grants.sql]",
      "template[/etc/mysql/my.cnf]",
      "template[/etc/memcached.conf]",
      "template[/etc/tomcat6/tomcat6.conf]"
    ].each do |template_with_delayed_action|
      if resource.to_s == template_with_delayed_action
        if resource.actions[:run]
          resource.actions[:run][:delayed].clear if resource.actions[:run][:delayed]
          resource.actions[:run][:immediate].clear if resource.actions[:run][:immediate]
        end
      end
    end
  end

  collection.each do |r|
    # Switch every service resource off
    r.action :nothing if r.resource_name == :service
    # Find all notified/subscribed actions on services and switch them off too
    r.actions.each do |action, timings|
      timings.each do |timing, resources|
        resources.each do |notified_resource|
          notified_resource.action :nothing if notified_resource.resource_name == :service
        end
      end
    end
  end
end
