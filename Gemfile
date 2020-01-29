# frozen_string_literal: true

source "https://rubygems.org"

gemspec

platforms :mri do
  gem "github_changelog_generator"
  gem "pry"
  gem "redcarpet", "~> 3.4"
  gem "reek", ">= 5.3"
  gem "rubocop"
  gem "rubocop-performance"
  gem "rubocop-rspec"
  gem "travis"
end

install_if -> { RUBY_PLATFORM =~ /darwin/ } do
  gem "fuubar"
  gem "rspec-nc"
end
