# 
#  base.rb
#  templates
#  
#  Created by Iain Wood on 2009-06-19.
#  Copyright 2009 Soulflyer. All rights reserved.
# 

run "echo TODO > README"
run "rm public/index.html"
generate :app_layout

# ========================================================
# = Install the test tools for the test environment only =
# ========================================================

file "/tmp/test.rb", <<-END
config.gem "rspec", :lib => false
config.gem "rspec-rails", :lib => false
config.gem "webrat"
config.gem "cucumber"
config.gem "thoughtbot-factory_girl", :lib => "factory_girl", :source => "http://gems.github.com/"
END
run "cat tmp/test.rb >> config/environments/test.rb"
run "rm tmp/test.rb"
# rake "gems:install", :env => 'test', :sudo => true
generate :cucumber

# ===============================
# = Generate static pages stuff =
# ===============================
generate :rspec_scaffold, "page name:string permalink:string content:text"
# RedCloth uses native code. It's already installed, so why recompile into vendor every time? Don't forget to
# check when installing on production server.......
# gem 'RedCloth', :source => "http://code.whytheluckystiff.net"
run "rm app/views/layouts/pages.html.erb"


# =============================
# = Add authentication stuff =
# =============================
gem 'thoughtbot-clearance', 
  :lib     => 'clearance', 
  :source  => 'http://gems.github.com'
  
# rake "gems:install", :sudo => true
rake "gems:unpack"
generate :clearance
# remove the paths file or generate :clearance_features will hang (waiting for confirmation of overwrite)
run "rm features/support/paths.rb"
generate :clearance_features

# Add the host details to the config files for clearance
# All the backslashes are there to get the new lines into the text echoed into the config files
# This is to avoid creating a separate file and cating it on to the end as is done for the gem config
# stuff above
host = "localhost:3000"
run "echo \\ >> config/environments/test.rb"
run "echo HOST=\\\"#{host}\\\" >> config/environments/test.rb"
run "echo \\ >> config/environments/development.rb"
run "echo HOST=\\\"#{host}\\\" >> config/environments/development.rb"
run "echo \\ >> config/environment.rb"
run "echo DO_NOT_REPLY=\\\"donotreply@example.com\\\" >> config/environment.rb"

# more clearance setup
route "map.root :controller => 'pages', :id => '1'"

# ==================================
# = Add paperclip for photo upload =
# ==================================
plugin "paperclip", :git => "git://github.com/thoughtbot/paperclip.git"

# =============
# = Finish up =
# =============
rake "db:migrate"

