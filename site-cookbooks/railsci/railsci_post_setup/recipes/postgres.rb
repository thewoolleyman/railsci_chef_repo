#
# Cookbook Name:: railsci_post_setup
# Recipe:: mysql
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

bash "Create postgres user" do
  postgres_user = "ubuntu"
  code "su - postgres -c 'createuser -s #{postgres_user}'"
  not_if "su - postgres -c \"psql -d postgres -U postgres -c 'select * from pg_user'\" | grep #{postgres_user}"
end

