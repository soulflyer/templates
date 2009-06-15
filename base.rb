run "echo TODO > README"
generate :app_layout
file "config/environments/test.rb", <<-END
config.gem "rspec", :lib => false
config.gem "rspec-rails", :lib => false
config.gem "webrat"
config.gem "cucumber"
# config.gem "notahat-machinist", :lib => "machinist"
config.gem "thoughtbot-factory_girl", :lib => "factory_girl", :source => "http://gems.github.com/"
rake "gems:install"
END