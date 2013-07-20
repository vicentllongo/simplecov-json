require 'helper'

class TestSimpleCovHtml < Test::Unit::TestCase
  def test_format
    formatter = SimpleCov::Formatter::JSONFormatter.new
    result = mock()
    created_at = DateTime.now.to_s
    
    result.expects(:created_at).returns(created_at)
    result.expects(:command_name).returns('RSpec')
    result.expects(:original_result).returns({
      '/lib/foo.rb' => [1, nil, 0, 0, nil, 1, nil],
      '/lib/bar.rb' => [nil, 1, nil, 1, 1, 1, 0, 0, nil, 1, nil],
      '/test/test.rb' => [nil, 1, 1, 1, 1]
    })
    result.expects(:filenames).returns(['/lib/foo.rb', '/lib/bar.rb'])
    result.expects(:filenames).returns(['/lib/foo.rb', '/lib/bar.rb'])
    result.expects(:filenames).returns(['/lib/foo.rb', '/lib/bar.rb'])
    result.expects(:covered_percent).returns(73.33)
    result.expects(:covered_strength).returns(0.87)
    result.expects(:covered_lines).returns(11)
    result.expects(:total_lines).returns(15)

    result.expects(:command_name).returns('RSpec')
    result.expects(:covered_lines).returns(11)
    result.expects(:total_lines).returns(15)
    result.expects(:covered_percent).returns(73.33)

    assert_equal(formatter.format(result), {
      'timestamp' => created_at.to_i, 
      'command_name' => 'RSpec', 
      'files' => [
        {'filename' => '/lib/foo.rb', 'coverage' => [1, nil, 0, 0, nil, 1, nil]},
        {'filename' => '/lib/bar.rb', 'coverage' => [nil, 1, nil, 1, 1, 1, 0, 0, nil, 1, nil]},
      ],
      'metrics' => {
        'covered_percent' => 73.33,
        'covered_strength' => 0.87,
        'covered_lines' => 11,
        'total_lines' => 15,
      } 
    }.to_json)
  end
end
