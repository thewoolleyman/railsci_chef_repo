package "libmysqlclient-dev" do
  action :upgrade
end

package "mysql-client" do
  action :upgrade
end

package "mysql-server" do
  action :upgrade
end

service "mysql" do
  action :nothing
  supports :status => true, :start => true, :stop => true, :restart => true
end

