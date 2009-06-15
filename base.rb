run "echo TODO > README"
generate :app_layout
# Install the test tools
file "/tmp/test.rb", <<-END
config.gem "rspec", :lib => false
config.gem "rspec-rails", :lib => false
config.gem "webrat"
config.gem "cucumber"
# config.gem "notahat-machinist", :lib => "machinist"
config.gem "thoughtbot-factory_girl", :lib => "factory_girl", :source => "http://gems.github.com/"
END
run "cat tmp/test.rb >> config/environments/test.rb"
rake "gems:install"
run "rm tmp/test.rb"