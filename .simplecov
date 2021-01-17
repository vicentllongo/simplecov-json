# frozen_string_literal: true

LOCAL_FORMATTERS = [
  SimpleCov::Formatter::SimpleFormatter,
  SimpleCov::Formatter::HTMLFormatter
].freeze

SimpleCov.start do
  add_filter '/spec/'
  add_filter '/bin/'
  add_filter '/gemfiles/'
  add_filter '/vendor/'
  add_filter '/lib/simple_cov/sublime/version.rb'

  add_group 'Formatter', 'lib/simple_cov/formatter'
  add_group 'Helpers',   'lib/simple_cov/sublime'

  enable_coverage :branch
  primary_coverage :branch

  if ENV['CI']
    formatter SimpleCov::Formatter::SimpleFormatter
  else
    require 'simplecov_json_formatter'

    formatter SimpleCov::Formatter::MultiFormatter.new(LOCAL_FORMATTERS)

    refuse_coverage_drop
    minimum_coverage line: 90, branch: 80
    minimum_coverage_by_file line: 90, branch: 80
  end

  track_files '**/*.rb'
end

SimpleCov.at_exit do
  SimpleCov.result.format!
  require 'simplecov-sublime'
  SimpleCov::Formatter::SublimeFormatter.new.format(SimpleCov.result)
end
