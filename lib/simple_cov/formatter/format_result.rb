# frozen_string_literal: true

module SimpleCov
  #
  # Module FormatResult uses Oj to dup the result to the configured output path
  #
  # @author Mikael Henriksson <mikael@mhenrixon.com>
  #
  module FormatResult
    def self.call(result, output_file_path)
      data = SimpleCov::Oj::ResultToHash.new(result).to_h
      json = ::Oj.dump(data, mode: :compat)

      File.open(output_file_path, 'w+') do |file|
        file.puts json
      end

      json
    end
  end
end
