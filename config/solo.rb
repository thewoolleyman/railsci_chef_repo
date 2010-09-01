chef_dir ||= File.join(ENV["HOME"],'.chef')
file_cache_path chef_dir
file_store_path chef_dir
log_level :debug
Chef::Log::Formatter.show_time = false
cookbook_path [
  File.join(chef_dir,"railsci_chef_repo/site-cookbooks/railsci")
]
