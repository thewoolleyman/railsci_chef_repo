RAILSCI CHEF REPO
=================

Chef Repo to support Continuous Integration of the Ruby on Rails framework itself.  See the main project at http://github.com/thewoolleyman/railsci

Copied from http://github.com/opscode/chef-repo

cookbooks/opscode is a git submodule pointing to the patch_integration branch of git://github.com/thewoolleyman/cookbooks.git.  This
is a fork of http://github.com/opscode/cookbooks.git with the following patches applied (TODO: keep up to date!):

* http://github.com/thewoolleyman/cookbooks/tree/COOK-308
* http://github.com/thewoolleyman/cookbooks/tree/COOK-312

I'm not sure how to manage this better without rolling all my own recipes or using chef-server, neither of which I want to do right now.  See
discussion at http://lists.opscode.com/sympa/arc/chef/2010-06/msg00048.html
