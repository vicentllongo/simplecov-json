# frozen_string_literal: true

module SimpleCov
  module Oj
    #
    # Massage result into a hash that can be dumped to json by OJ
    #
    # @author Mikael Henriksson <mikael@mhenrixon.se>
    #
    class ResultToHash
      #
      # Initialize a new ResultToHash
      #
      # @param [SimpleCov::Result] result the final result from simplecov
      #
      def initialize(result)
        @result = result
        @data = {
          timestamp: result.created_at.to_i,
          command_name: result.command_name,
          files: [],
        }
      end

      #
      # Create a hash from the result that can be used for JSON dumping
      #
      #
      # @return [Hash]
      #
      def to_h
        extract_files
        extract_metrics
        data
      end

      private

      attr_reader :result, :data

      # @private
      def extract_files
        data[:files] = source_file_collection
      end

      # @private
      def source_file_collection
        result.files.each_with_object([]) do |source_file, array|
          array << source_file_hash(source_file) if result.filenames.include?(source_file.filename)
        end
      end

      # @private
      def source_file_hash(source_file)
        { filename: source_file.filename,
          covered_percent: source_file.covered_percent,
          coverage_data: source_file.coverage_data,
          covered_strength: source_file.covered_strength.nan? ? 0.0 : source_file.covered_strength,
          covered_lines: source_file.covered_lines.count,
          lines_of_code: source_file.lines_of_code }
      end

      # @private
      def extract_metrics
        data[:metrics] = metrics_hash
      end

      # @private
      def metrics_hash
        {
          covered_percent: result.covered_percent,
          covered_strength: result.covered_strength.nan? ? 0.0 : result.covered_strength,
          covered_lines: result.covered_lines,
          total_lines: result.total_lines,
        }
      end
    end
  end
end
