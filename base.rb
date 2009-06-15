run "echo TODO > README"
generate :app_layout
gem "rspec", :lib => false
gem "rspec-rails", :lib => false
rake "gems"