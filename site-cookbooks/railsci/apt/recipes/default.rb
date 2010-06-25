e = execute "apt-get update" do
  action :nothing
end

e.run_action(:run)

%w{/var/cache/local /var/cache/local/preseeding}.each do |dirname|
  directory dirname do
    owner "root"
    group "root"
    mode  0755
    action :create
  end
end