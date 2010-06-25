maintainer       "Chad Woolley"
maintainer_email "thewoolleyman@gmail.com"
license          "Apache 2.0"
description      "Installs mysql"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.1.0"

%w{ubuntu debian}.each do |os|
  supports os
end

%w{runit}.each do |cb|
  depends cb
end