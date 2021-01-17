# frozen_string_literal: true

module SimpleCov
  #
  # Module FormatResult uses JSON to dump the result to the configured output path
  #
  # @author Mikael Henriksson <mikael@mhenrixon.com>
  #
  module FormatResult
    def self.call(result, output_file_path)
      data = SimpleCov::Sublime::ResultToHash.new(result).to_h
      json = ::JSON.dump(data)

      File.open(output_file_path, 'w+') do |file|
        file.puts json
      end

      json
    end
  end
end
