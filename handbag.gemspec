$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "handbag/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "handbag"
  s.version     = Handbag::VERSION
  s.authors     = ["Frank Rietta"]
  s.email       = ["frank@rietta.com"]
  s.homepage    = "https://github.com/rietta/handbag"
  s.summary     = "User has_many :possessions, through: purse"
  s.description = "Handbag is a Ruby implementation of the Purse pattern, which is intended to enable robust implementations of anonymous user and access control that is decoupled from user accounts."
 
  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", ">= 3.2"
  s.add_dependency "uuidtools", "~> 2.1.4"

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'

  # This is just needed when testing in JRuby
  # s.add_development_dependency "activerecord-jdbcsqlite3-adapter"
end
