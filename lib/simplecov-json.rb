require 'simplecov'
require 'json'

class SimpleCov::Formatter::JSONFormatter
  def format(result)
    data = {}
    data[:timestamp] = result.created_at.to_i
    data[:command_name] = result.command_name
    data[:files] = []
    result.original_result.each do |filename,coverage| 
      next unless result.filenames.include? filename
      data[:files] << {
        filename: filename,
        coverage: coverage,
      }
    end
    data[:groups] = result.groups
    data[:metrics] = {
      covered_percent: result.covered_percent,
      covered_strength: result.covered_strength,
      covered_lines: result.covered_lines,
      total_lines: result.total_lines,
    }
    data[:reports] = result.reports
    File.open(File.join(output_path, output_filename), "w+") do |file|
      file.puts data.to_json
    end
    puts output_message(result)
    data.to_json
  end

  def output_filename
    'coverage.json'
  end

  def output_filepath
    File.join(output_path, output_filename)
  end

  def output_message(result)
    "Coverage report generated for #{result.command_name} to #{output_filepath}. #{result.covered_lines} / #{result.total_lines} LOC (#{result.covered_percent.round(2)}%) covered."
  end

  private 
  
  def output_path
    SimpleCov.coverage_path
  end
end
