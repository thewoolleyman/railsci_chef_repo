maintainer       "Chad Woolley"
maintainer_email "thewoolleyman@opscode.com"
license          "Apache 2.0"
description      "Installs TeamCity Continuous Integration server by JetBrains"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.1.0"

%w{ubuntu debian}.each do |os|
  supports os
end