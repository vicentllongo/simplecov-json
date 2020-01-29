# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "simplecov/oj/version"

Gem::Specification.new do |spec|
  spec.name        = "simplecov-oj"
  spec.version     = SimpleCov::Oj::VERSION
  spec.platform    = Gem::Platform::RUBY
  spec.authors     = ["Mikael Henriksson"]
  spec.email       = ["mikael@mhenrixon.com"]
  spec.homepage    = "https://github.com/mhenrixon/simplecov-oj"
  spec.license     = "MIT"
  spec.summary     = <<~SUMMARY
    Oj formatter for SimpleCov code coverage tool for ruby 2.4+
  SUMMARY
  spec.description = <<~DESCRIPTION
    Oj formatter for SimpleCov code coverage tool for ruby 2.4+
  DESCRIPTION

  raise "RubyGems 2.0 or newer is required to protect against public gem pushes." unless spec.respond_to?(:metadata)

  spec.metadata["homepage_uri"]      = spec.homepage
  spec.metadata["bug_tracker_uri"]   = "https://github.com/mhenrixon/mhenrixon/issues"
  spec.metadata["documentation_uri"] = "https://mhenrixon.github.io/simplecov-oj"
  spec.metadata["source_code_uri"]   = "https://github.com/mhenrixon/simplecov-oj"
  spec.metadata["changelog_uri"]     = "https://github.com/mhenrixon/simplecov-oj/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").select do |file|
      file.match(%r{^(lib/*|README|LICENSE|CHANGELOG)})
    end
  end
  spec.test_files    = ["test/spec_helper.rb", "spec/simplecov/formatter/oj_formatter_spec.rb"]
  spec.require_paths = ["lib"]

  spec.add_dependency "oj", ">= 2.0", "< 5.0"
  spec.add_dependency "simplecov", "~> 0.18", "< 1.0"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "fuubar"
  spec.add_development_dependency "gem-release", "~> 2.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-nc"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubocop-performance"
  spec.add_development_dependency "rubocop-rspec"
end
