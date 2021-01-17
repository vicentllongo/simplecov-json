# simplecov-sublime

[![Maintainability](https://api.codeclimate.com/v1/badges/4da5beeb8233b5739e07/maintainability)](https://codeclimate.com/github/mhenrixon/simplecov-sublime/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/4da5beeb8233b5739e07/test_coverage)](https://codeclimate.com/github/mhenrixon/simplecov-sublime/test_coverage)

JSON formatter for the ruby 2.5+ code coverage gem SimpleCov

## Usage

1. Add simplecov-sublime to your `Gemfile` and `bundle install`:

```ruby
gem 'simplecov-sublime', require: false, group: :test
```

2. Require simplecov-sublime and set it up as SimpleCov's formatter:

```ruby
require 'simplecov-sublime'
SimpleCov.formatter = SimpleCov::Formatter::SublimeFormatter
```

## Result

Generated JSON can be found in coverage/sublime.json

The format you can expect is:
```json
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
  ],
  "metrics": {
    "covered_percent": 81.70731707317073,
    "covered_strength": 0.8170731707317073,
    "covered_lines": 67,
    "total_lines": 82
  }
}
```

## Making Contributions

If you want to contribute, please:

  * Fork the project.
  * Make your feature addition or bug fix.
  * Add tests for it. This is important so I don't break it in a future version unintentionally.
  * Send me a pull request on Github.
  * Check that travis build passes for your pull request.


## Copyright

Copyright (c) 2020 Mikael Henriksson. See LICENSE for details.
