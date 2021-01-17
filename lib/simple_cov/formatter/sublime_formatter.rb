# frozen_string_literal: true

# @see SimpleCov https://github.com/colszowka/simplecov
module SimpleCov
  # @see SimpleCov::Formatter https://github.com/colszowka/simplecov
  module Formatter
    #
    # Formats Simplecov Results into a json file `coverage.json`
    #
    # @author Mikael Henriksson <mikael@mhenrixon.se>
    #
    class SublimeFormatter
      #
      # @return [String] name of the file with coverage.json data
      FILE_NAME = 'sublime.json'
      OUTPUT_FILE_PATH = File.join(SimpleCov.coverage_path, FILE_NAME)

      #
      # Formats the result as a hash, dump it to json with JSON and then save it to disk
      #
      # @param [SimpleCov::Result] result
      #
      # @return [<type>] <description>
      #
      def format(result)
        json = SimpleCov::FormatResult.call(result, OUTPUT_FILE_PATH)
        puts SimpleCov::Sublime::OutputMessage.new(result, OUTPUT_FILE_PATH)

        json
      end
    end
  end
end
