maintainer       "Chad Woolley"
maintainer_email "thewoolleyman@opscode.com"
license          "Apache 2.0"
description      "Disable all chef actions which do not work under chroot"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.1.0"

%w{ubuntu debian}.each do |os|
  supports os
end
