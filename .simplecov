# frozen_string_literal: true

require 'simplecov-material'
require 'simplecov-oj'

SimpleCov.command_name 'RSpec'
# SimpleCov.refuse_coverage_drop
SimpleCov.formatters = [
  # SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::MaterialFormatter,
  SimpleCov::Formatter::OjFormatter
]

SimpleCov.start do
  add_filter '/spec/'
  add_filter '/bin/'
  add_filter '/gemfiles/'

  add_group 'Formatter', 'lib/simple_cov/formatter'
  add_group 'Helpers',   'lib/simple_cov/oj'
end
