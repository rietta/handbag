source "https://rubygems.org"

# Declare your gem's dependencies in handbag.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use debugger
# gem 'debugger'

# If this platform is JRuby, install these gems
platforms :jruby do
  gem 'activerecord-jdbcsqlite3-adapter', :require => false
end
# Else, use these instead
platforms :ruby do
end

group :development do
  gem 'annotate'
  gem 'pry'
end