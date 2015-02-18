module SimpleCov
  module Mocks
    def mock_src chars, lines
      src = []
      (1...lines).each do
        line = ((1...chars).map { (65 + rand(26)).chr }.join)
        src << line
      end
      src.join("\n")
    end

    def mock_file root, filename, src, coverage
      filepath = "#{root}#{filename}"
      dirname = File.dirname(filepath)
      FileUtils.mkdir_p(dirname)
      File.write(filepath,src)

      file = mock()

      lines_of_code = coverage.reject {|i| i.nil? }.length
      covered_lines = coverage.select {|i| i == 1 }
      covered_percent = lines_of_code > 0 ? ((covered_lines.count * 100.0) / lines_of_code).to_f : 100.0
      covered_strength = covered_percent

      file.expects(:filename).times(4).returns(filepath)
      file.expects(:covered_percent).once.returns(covered_percent)
      file.expects(:coverage).returns(coverage)
      file.expects(:covered_strength).twice.returns(covered_strength)
      file.expects(:covered_lines).twice.returns(covered_lines)
      file.expects(:lines_of_code).twice.returns(lines_of_code)
      
      file_output = {
        'filename' => filename,
        'src' => src,
        'covered_percent' => covered_percent,
        'coverage' => coverage,
        'covered_strength' => covered_strength,
        'covered_lines' => covered_lines.count,
        'lines_of_code' => lines_of_code
      }

      {
        filepath: filepath,
        file: file,
        output: file_output
      }
    end

    def mock_project command, files, time
      result = mock()
      created_at = time
      result.expects(:created_at).returns(created_at)
      result.expects(:command_name).twice.returns(command)

      filemocks = files.map {|f| f[:file]}
      filenames = files.map {|f| f[:filepath]}
      total_lines = filemocks.inject(0) { |sum,f| sum + f.lines_of_code }
      covered_lines = filemocks.inject(0) { |sum,f| sum + f.covered_lines.count }
      covered_percent = total_lines > 0 ? (covered_lines/total_lines).to_f : 100.0
      covered_strength = covered_percent/100

      result.expects(:files).returns(filemocks)
      result.expects(:filenames).times(files.count).returns(filenames)
      result.expects(:covered_percent).twice.returns(covered_percent)
      result.expects(:covered_strength).twice.returns(covered_strength)
      result.expects(:covered_lines).twice.returns(covered_lines)
      result.expects(:total_lines).twice.returns(total_lines)

      expected_output = {
        'type' => 'simplecov-json',
        'version' => SimpleCov::Formatter::JSONFormatter::VERSION,
        'timestamp' => created_at.to_i,
        'command_name' => command,
        'files' => files.map {|f| f[:output] },
        'metrics' => {
          'covered_percent' => covered_percent,
          'covered_strength' => covered_strength,
          'covered_lines' => covered_lines,
          'total_lines' => total_lines
        }
      }

      {
        result: result,
        output: expected_output
      }
    end
  end
end
