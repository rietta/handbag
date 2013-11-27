$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "handbag/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "handbag"
  s.version     = Handbag::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Handbag."
  s.description = "TODO: Description of Handbag."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.1"

  s.add_development_dependency "activerecord-jdbcsqlite3-adapter"
end
