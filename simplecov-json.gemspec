# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "simplecov-json"
  s.version     = '0.2.3'
  s.licenses    = ['MIT']
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Vicent Llongo"]
  s.email       = ["villosil@gmail.com"]
  s.homepage    = "https://github.com/vicentllongo/simplecov-json"
  s.summary     = %Q{JSON formatter for SimpleCov code coverage tool for ruby 1.9+}
  s.description = %Q{JSON formatter for SimpleCov code coverage tool for ruby 1.9+}

  s.rubyforge_project = "simplecov-json"
  s.files         = ['lib/simplecov-json.rb']
  s.test_files    = ['test/helper.rb', 'test/test_simplecov_json.rb']
  s.require_paths = ["lib"]

  s.add_dependency "simplecov"
  s.add_dependency "json"

  s.add_development_dependency "rake"
end
