# frozen_string_literal: true

module SimpleCov
  module Formatter
    #
    # Formats Simplecov Results into a json file `coverage.json`
    #
    # @author Mikael Henriksson <mikael@zoolutions.se>
    #
    class OjFormatter
      FILE_NAME = "coverage.json"

      #
      # Formats the result as
      #
      # @param [<type>] result <description>
      #
      # @return [<type>] <description>
      #
      def format(result)
        data = SimpleCov::Oj::ResultToHash.new(result).to_h
        json = ::Oj.dump(data, mode: :compat)

        File.open(output_filepath, "w+") do |file|
          file.puts json
        end

        puts output_message(result)

        json
      end

      def output_filename
        FILE_NAME
      end

      def output_filepath
        File.join(output_path, output_filename)
      end

      def output_message(result)
        "Coverage report generated" \
        " for #{result.command_name}" \
        " to #{output_filepath}." \
        " #{result.covered_lines} / #{result.total_lines} LOC (#{result.covered_percent.round(2)}%) covered."
      end

      private

      def output_path
        SimpleCov.coverage_path
      end
    end
  end
end
