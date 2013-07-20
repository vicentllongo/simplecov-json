require 'helper'

class TestSimpleCovHtml < Test::Unit::TestCase
  def test_format
    formatter = SimpleCov::Formatter::JSONFormatter.new
    result = mock()
    foo = mock()
    bar = mock()
    created_at = DateTime.now.to_s
    result.expects(:created_at).returns(created_at)
    result.expects(:command_name).returns('RSpec')
    
    fooLineList = mock()
    fooLineList.expects(:count).returns(2)

    barLineList = mock()
    barLineList.expects(:count).returns(5)

    foo.expects(:filename).twice.returns('/lib/foo.rb')
    foo.expects(:covered_percent).returns(50.0)
    foo.expects(:coverage).returns([1, nil, 0, 0, nil, 1, nil])
    foo.expects(:covered_strength).twice.returns(0.50)
    foo.expects(:covered_lines).returns(fooLineList)
    foo.expects(:lines_of_code).returns(4)
    
    bar.expects(:filename).twice.returns('/lib/bar.rb')
    bar.expects(:covered_percent).returns(71.42)
    bar.expects(:coverage).returns([nil, 1, nil, 1, 1, 1, 0, 0, nil, 1, nil])
    bar.expects(:covered_strength).twice.returns(0.71)
    bar.expects(:covered_lines).returns(barLineList)
    bar.expects(:lines_of_code).returns(7)

    result.expects(:files).returns([foo, bar])
    result.expects(:filenames).twice.returns(['/lib/foo.rb', '/lib/bar.rb'])
    result.expects(:covered_percent).returns(73.33)
    result.expects(:covered_strength).twice.returns(0.87)
    result.expects(:covered_lines).returns(11)
    result.expects(:total_lines).returns(15)

    result.expects(:command_name).returns('RSpec')
    result.expects(:covered_lines).returns(11)
    result.expects(:total_lines).returns(15)
    result.expects(:covered_percent).returns(73.33)


    # filename
    # covered_percent
    # coverage
    # covered_strength
    # covered_lines
    # lines_of_code
    assert_equal(formatter.format(result), {
      'timestamp' => created_at.to_i, 
      'command_name' => 'RSpec', 
      'files' => [
        {'filename' => '/lib/foo.rb',
          'covered_percent' => 50.0,
          'coverage' => [1, nil, 0, 0, nil, 1, nil],
          'covered_strength' => 0.50,
          'covered_lines' => 2,
          'lines_of_code' => 4
        },
        {'filename' => '/lib/bar.rb',
          'covered_percent' => 71.42,
          'coverage' => [nil, 1, nil, 1, 1, 1, 0, 0, nil, 1, nil],
          'covered_strength' => 0.71,
          'covered_lines' => 5,
          'lines_of_code' => 7
        },
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
