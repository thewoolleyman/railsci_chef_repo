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

collection.each do |r|
 # Switch every service resource off
 r.action :nothing if r.resource_name == :service
 # Find all notified/subscribed actions on services and switch them off too
 r.actions.each do |action, timings|
   p 11111111111111111
   p action
   timings.each do |timing, resources|
     p 2222222222
     p timing
     resources.each do |notified_resource|
       p 33333333333333

       p notified_resource.cookbook_name
       p notified_resource.recipe_name
       p notified_resource.resource_name
       p notified_resource.action
       p notified_resource.actions
       p notified_resource.allowed_actions
       p notified_resource.node

       notified_resource.action :nothing if
notified_resource.resource_name == :service
     end
   end
 end
end
