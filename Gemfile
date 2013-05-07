source 'https://rubygems.org'

gemspec

group :development do
  gem "mocha", :require => false
  # Use local copy of simplecov in development when checked out or fetch from git
=begin
  if File.directory?(File.dirname(__FILE__) + '/../simplecov')
    gem 'simplecov', :path => File.dirname(__FILE__) + '/../simplecov'
  else
    gem 'simplecov', :git => 'https://github.com/colszowka/simplecov'
  end
=end

  gem 'simplecov', '=0.8.1.ooyala'
end
