simplecov-json
==============

JSON formatter for the ruby 1.9+ coverage gem SimpleCov

Usage
-----

1. Add simplecov-json to your `Gemfile` and `bundle install`:

        gem 'simplecov-json', :require => false, :group => :test

2. Require simplecov-json and set it up as SimpleCov's formatter: 

        require 'simplecov-json'
        SimpleCov.formatter = SimpleCov::Formatter::JSONFormatter

Result
------

Generated JSON can be found in coverage/coverage.json

The format you can expect is:

        {
            "timestamp": 1348489587,
            "command_name": "RSpec",
            "files": [
                {
                    "filename": "/home/user/rails/environment.rb",
                    "coverage": [
                        null,
                        1,
                        null,
                        null,
                        1
                    ]
                },
                ...
            ],
            "groups": {},
            "metrics": {
                  "covered_percent": 81.70731707317073,
                  "covered_strength": 0.8170731707317073,
                  "covered_lines": 67,
                  "total_lines": 82
            },
            "reports": [
                {
                    "type": {
                        "main": "cool_report"
                    },
                    "title": "Cool report",
                    "items": {}
                }
            ]
        }

## Copyright

Copyright (c) 2012 Vicent Llongo. See LICENSE for details.
