if (node[:ec2] && ! FileTest.directory?(node[:mysql][:ec2_path]) && FileTest.directory?(node[:mysql][:datadir]))

  service "mysql" do
    action :stop
  end

  execute "install-mysql" do
    command "mv #{node[:mysql][:datadir]} #{node[:mysql][:ec2_path]}"
    not_if do FileTest.directory?(node[:mysql][:ec2_path]) end
  end

  directory node[:mysql][:ec2_path] do
    owner "mysql"
    group "mysql"
  end

  mount node[:mysql][:datadir] do
    device node[:mysql][:ec2_path]
    fstype "none"
    options "bind,rw"
    action :mount
  end

  service "mysql" do
    action :start
  end

end

