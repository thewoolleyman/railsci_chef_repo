include_recipe "apt"

template "/etc/apt/sources.list.d/canonical.com.list" do
  mode "0644"
  source "canonical.com.list.erb"
  notifies :run, resources(:execute => "apt-get update"), :immediately
end

execute "update-java-alternatives" do
  command "update-java-alternatives --jre-headless -s java-6-sun"
  ignore_failure true
  returns 0
  action :nothing
end

package "sun-java6-jdk" do
  action :install
  response_file "java.seed"
  notifies :run, resources(:execute => "update-java-alternatives"), :immediately
end