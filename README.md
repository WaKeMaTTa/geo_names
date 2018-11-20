# GeoNames

GeoNames Ruby API Wrapper

[![Build Status](https://travis-ci.org/WaKeMaTTa/geo_names.svg?branch=master)](https://travis-ci.org/WaKeMaTTa/geo_names)
[![Maintainability](https://api.codeclimate.com/v1/badges/a69ae1a450119061f8e2/maintainability)](https://codeclimate.com/github/WaKeMaTTa/geo_names/maintainability)

This gem is a ruby API wrapper for [GeoNames](https://www.geonames.org/) [API's](https://www.geonames.org/export/web-services.html).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'geo_names'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install geo_names
```

## Usage

### Pre-requirement

You need a valid `username` to use the gem. You can get it by signing up [here](http://www.geonames.org/login).

If you don't set the `username` it will *raises an exception*.

### Configuration

You can use add initializer for example if you're on Rails.

```ruby
# config/initializers/geo_names.rb

GeoNames.configure do |config|
  config.username = ENV['GEONAMES_USERNAME']
end
```

### Searching

```ruby
result = GeoNames::Search.search
# it returns a hash of the parsed JSON result
# or
# raise an exception if the parsed JSON contains an error status_code
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at [geo_names repository](https://github.com/wakematta/geo_names). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the GeoNames project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/geo_names/blob/master/CODE_OF_CONDUCT.md).
