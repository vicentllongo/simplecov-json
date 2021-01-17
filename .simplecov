# frozen_string_literal: true

if ENV['COV'] == 'true'
  SimpleCov.start do
    self.formatters = [
      SimpleCov::Formatter::HTMLFormatter
    ]
    # command_name 'RSpec'
    # enable_coverage :branch

    add_filter '/spec/'
    add_filter '/bin/'
    add_filter '/gemfiles/'
    add_filter '/vendor/'

    add_group 'Formatter', 'lib/simple_cov/formatter'
    add_group 'Helpers',   'lib/simple_cov/oj'
  end

  SimpleCov.at_exit do
    SimpleCov.result.format!
    require 'simplecov-oj'
    SimpleCov::Formatter::OjFormatter.new.format(SimpleCov.result)
  end
end
