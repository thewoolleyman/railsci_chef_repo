package "memcached" do
  action :upgrade
end

package "libmemcache-dev" do
  action :upgrade
end

service "memcached" do
  action :nothing
  supports :status => true, :start => true, :stop => true, :restart => true
end

