require 'helper'

class TestSimpleCovJson < Test::Unit::TestCase
  include SimpleCov::Mocks

  COVERAGE_SELECTION = [1, nil, 0]

  def test_format_no_coverage
    formatter = SimpleCov::Formatter::JSONFormatter.new
    SimpleCov::Formatter::JSONFormatter.pretty_format(false)

    root = '/myproject'
    SimpleCov.root(root)

    foo_src = ''
    foo_coverage = []
    foo = mock_file(root, '/lib/foo.rb', foo_src, foo_coverage)
    project = mock_project('RSpec', [foo], DateTime.now.to_s)

    assert_equal(formatter.format(project[:result]), project[:output].to_json)
  end

  def test_format_default
    formatter = SimpleCov::Formatter::JSONFormatter.new
    SimpleCov::Formatter::JSONFormatter.pretty_format(false)

    root = '/myproject'
    SimpleCov.root(root)

    foo_src =<<END
    dummy source for /myproject/lib/bar.rb
END
    foo_coverage = foo_src.split(/\n/).map do |line|
      COVERAGE_SELECTION.sample
    end

    bar_src =<<END
    dummy source for /myproject/lib/bar.rb
END
    bar_coverage = bar_src.split(/\n/).map do |line|
      COVERAGE_SELECTION.sample
    end

    foo = mock_file(root, '/lib/foo.rb', foo_src, foo_coverage)
    bar = mock_file(root, '/lib/bar.rb', bar_src, bar_coverage)
    project = mock_project('RSpec', [foo,bar], DateTime.now.to_s)

    assert_equal(formatter.format(project[:result]), project[:output].to_json)
  end

  def test_format_pretty
    formatter = SimpleCov::Formatter::JSONFormatter.new
    SimpleCov::Formatter::JSONFormatter.configure do |config|
      config.pretty_format true
    end

    root = '/myproject'
    SimpleCov.root(root)

    foo_src =<<END
    dummy source for /myproject/lib/bar.rb
END
    foo_coverage = foo_src.split(/\n/).map do |line|
      COVERAGE_SELECTION.sample
    end

    bar_src =<<END
    dummy source for /myproject/lib/bar.rb
END
    bar_coverage = bar_src.split(/\n/).map do |line|
      COVERAGE_SELECTION.sample
    end

    foo = mock_file(root, '/lib/foo.rb', foo_src, foo_coverage)
    bar = mock_file(root, '/lib/bar.rb', bar_src, bar_coverage)
    project = mock_project('RSpec', [foo,bar], DateTime.now.to_s)

    assert_equal(formatter.format(project[:result]), JSON.pretty_generate(project[:output]))
  end

end
