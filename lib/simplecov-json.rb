require 'simplecov'
require 'json'

class SimpleCov::Formatter::JSONFormatter
  def format(result)
    data = {}
    data[:timestamp] = result.created_at.to_i
    data[:command_name] = result.command_name
    data[:files] = result.files.map do |file|
                     map_source_file(file, result)
                   end.select { |file| result.filenames.include? file[:filename] }

    data[:metrics] = {
      covered_percent: result.covered_percent,
      covered_strength: result.covered_strength.nan? ? 0.0 : result.covered_strength,
      covered_lines: result.covered_lines,
      total_lines: result.total_lines
    }

    json = data.to_json

    File.open(output_filepath, 'w+') do |file|
      file.puts json
    end

    puts output_message(result)

    json
  end

  def map_source_file(source_file, result)
    coverage_data = (defined? source_file.coverage) ? source_file.coverage : source_file.coverage_data
    {
      filename: source_file.filename,
      covered_percent: source_file.covered_percent,
      coverage: coverage_data,
      covered_strength: source_file.covered_strength.nan? ? 0.0 : source_file.covered_strength,
      covered_lines: source_file.covered_lines.count,
      lines_of_code: source_file.lines_of_code,
      group: result.groups.find { |_, group| group.include?(source_file) }&.first&.to_s
    }
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
