$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "iddsystem_plugins/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "iddsystem_plugins"
  s.version     = IddsystemPlugins::VERSION
  s.authors     = ["Opan Mustopah"]
  s.email       = ["opan.neutron@gmail.com"]
  s.homepage    = "https://github.com/opan/iddsystem_plugins"
  s.summary     = "Website engine systems."
  s.description = "Provide a powerfull website engine systems."
  s.licenses    = ["MIT"]

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4.0.0", "< 5.0"
  s.add_dependency "bcrypt-ruby", "~> 3.1", ">= 3.1.2"
  s.add_dependency "ransack", "~> 1.2"
  s.add_dependency "kaminari", ">= 0.14.1", "< 0.16"
  s.add_dependency "haml", "~> 4.0"
  s.add_dependency "dynamic_form", '~> 1.1', '>= 1.1.4'
  s.add_dependency "jquery-rails", "~> 3"
  s.add_dependency "coffee-rails", "~> 4"
  s.add_dependency "sass-rails", "~> 4.0"
  s.add_dependency "uglifier", ">= 2.2", "< 3.0"

  # s.add_development_dependency "sqlite3", "~>"
  s.add_development_dependency "pg", "~> 0"
  s.add_development_dependency "debugger", "~> 0"

end
