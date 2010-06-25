package "postgresql-8.4" do
  action :upgrade
end

package "postgresql-client-8.4" do
  action :upgrade
end

service "postgresql" do
  action :nothing
  supports :status => true, :start => true, :stop => true, :restart => true
end

