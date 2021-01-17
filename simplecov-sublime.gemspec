# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'simple_cov/sublime/version'

Gem::Specification.new do |spec|
  spec.name        = 'simplecov-sublime'
  spec.version     = SimpleCov::Sublime::VERSION
  spec.platform    = Gem::Platform::RUBY
  spec.authors     = ['Mikael Henriksson']
  spec.email       = ['mikael@mhenrixon.com']
  spec.homepage    = 'https://github.com/mhenrixon/simplecov-sublime'
  spec.license     = 'MIT'
  spec.summary     = <<~SUMMARY
    Sublime formatter for SimpleCov code coverage tool for ruby 2.5+
  SUMMARY
  spec.description = <<~DESCRIPTION
    Sublime  formatter for SimpleCov code coverage tool for ruby 2.5+
  DESCRIPTION

  raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.' unless spec.respond_to?(:metadata)

  spec.metadata['homepage_uri']      = spec.homepage
  spec.metadata['bug_tracker_uri']   = 'https://github.com/mhenrixon/mhenrixon/issues'
  spec.metadata['documentation_uri'] = 'https://mhenrixon.github.io/simplecov-oj'
  spec.metadata['source_code_uri']   = 'https://github.com/mhenrixon/simplecov-oj'
  spec.metadata['changelog_uri']     = 'https://github.com/mhenrixon/simplecov-oj/CHANGELOG.md'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").select do |file|
      file.match(%r{^(lib/*|README|LICENSE|CHANGELOG)})
    end
  end
  spec.test_files    = ['spec/spec_helper.rb', 'spec/simple_cov/formatter/oj_formatter_spec.rb']
  spec.require_paths = ['lib']

  spec.required_ruby_version = '~> 2.5'

  spec.add_dependency 'json'
  spec.add_dependency 'simplecov', '~> 0.14', '< 1.0.0'

  spec.add_development_dependency 'appraisal'
  spec.add_development_dependency 'bundler', '~> 2.1'
  spec.add_development_dependency 'gem-release', '~> 2.0'
  spec.add_development_dependency 'json_spec'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.9'

  # ===== Documentation =====
  spec.add_development_dependency 'github_changelog_generator', '~> 1.14'
  spec.add_development_dependency 'github-markup', '~> 3.0'
  # spec.add_development_dependency "redcarpet", "~> 3.4"
  spec.add_development_dependency 'yard', '~> 0.9'
end
