# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'simplecov-json/version'

Gem::Specification.new do |s|
  s.name        = "simplecov-json"
  s.version     = SimpleCov::Formatter::JSONFormatter::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Vicent Llongo"]
  s.email       = ["villosil@gmail.com"]
  s.homepage    = "https://github.com/vicentllongo/simplecov-json"
  s.summary     = %Q{JSON formatter for SimpleCov code coverage tool for ruby 1.9+}
  s.description = %Q{JSON formatter for SimpleCov code coverage tool for ruby 1.9+}

  s.rubyforge_project = "simplecov-json"
  s.files         = `git ls-files -z`.split("\x0")
  s.test_files    = s.files.grep(%r{^test/})
  s.require_paths = ["lib"]

  s.add_dependency "simplecov"
  s.add_dependency "json"
  
  s.add_development_dependency "rake"
  s.add_development_dependency "fakefs"
  s.add_development_dependency "mocha", "~> 0.14"
end
