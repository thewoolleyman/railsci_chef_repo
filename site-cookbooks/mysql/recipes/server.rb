case node[:platform]
when "debian","ubuntu"
  template "/var/cache/local/preseeding/mysql-server.seed" do
    source "mysql-server.seed.erb"
    owner "root"
    group "root"
    mode "0600"
  end
end

template value_for_platform([ "centos", "redhat", "suse" ] => {"default" => "/etc/my.cnf"}, "default" => "/etc/mysql/my.cnf") do
  source "my.cnf.erb"
  owner "root"
  group "root"
  mode "0644"
end

begin
  t = resources(:template => "/etc/mysql/grants.sql") do
    mode "0644"
  end
rescue
  Chef::Log.warn("Could not find previously defined grants.sql resource")
  t = template "/etc/mysql/grants.sql" do
    source "grants.sql.erb"
    owner "root"
    group "root"
    mode "0644"
    action :create
  end
end
