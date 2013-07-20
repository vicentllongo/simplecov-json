# simplecov-json

JSON formatter for the ruby 1.9+ code coverage gem SimpleCov

## Usage

1. Add simplecov-json to your `Gemfile` and `bundle install`:

        gem 'simplecov-json', :require => false, :group => :test

2. Require simplecov-json and set it up as SimpleCov's formatter: 

        require 'simplecov-json'
        SimpleCov.formatter = SimpleCov::Formatter::JSONFormatter

## Result

Generated JSON can be found in coverage/coverage.json

The format you can expect is:

        {
            "timestamp": 1348489587,
            "command_name": "RSpec",
            "files": [
                {
                    "filename": "/home/user/rails/environment.rb",
                    "covered_percent": 50.0,
                    "coverage": [
                        null,
                        1,
                        null,
                        null,
                        1
                    ],
                    "covered_strength": 0.50,
                    "covered_lines": 2,
                    "lines_of_code": 4
                },
                ...
            ],
            "metrics": {
                  "covered_percent": 81.70731707317073,
                  "covered_strength": 0.8170731707317073,
                  "covered_lines": 67,
                  "total_lines": 82
            }
        }

## Making Contributions

If you want to contribute, please:

  * Fork the project.
  * Make your feature addition or bug fix.
  * Add tests for it. This is important so I don't break it in a future version unintentionally.
  * Send me a pull request on Github.
  * Check that travis build passes for your pull request.


## Copyright

Copyright (c) 2013 Vicent Llongo. See LICENSE for details.
