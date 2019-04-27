# GeoNames

GeoNames Ruby API Wrapper

[![Build Status](https://travis-ci.org/WaKeMaTTa/geo_names.svg?branch=master)](https://travis-ci.org/WaKeMaTTa/geo_names)
[![Maintainability](https://api.codeclimate.com/v1/badges/a69ae1a450119061f8e2/maintainability)](https://codeclimate.com/github/WaKeMaTTa/geo_names/maintainability)
![GitHub](https://img.shields.io/github/license/wakematta/geo_names.svg)

This gem is a ruby API wrapper for [GeoNames](https://www.geonames.org/) [API's](https://www.geonames.org/export/web-services.html).

## Security

Multifactor authentication:

![Security github.com account](https://img.shields.io/badge/github.com-enabled-brightgreen.svg)
![Security rubygems.org account](https://img.shields.io/badge/rubygems.org-enabled-brightgreen.svg)

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

#### How to search?

First you need a `Hash` with the criteria that you want to search.

```ruby
# example of criteria
criteria = {
  country_code: 'US',
  name: 'New York',
  featureClass: %w[P S],
  maxRows: 1,
  style: 'short'
}
```

Then you can search
```ruby
result = GeoNames::Search.search(criteria)
```

The `result` it will be a `Hash` if was successful, like this one:
```ruby
{ "totalResultsCount" => 1360,
  "geonames" => [
    { "lng" => "-74.00597",
      "geonameId" => 5128581,
      "countryCode" => "US",
      "name" => "New York",
      "toponymName" => "New York City",
      "lat" => "40.71427",
      "fcl" => "P",
      "fcode" => "PPL"
    }
  ]
}
```

Or if something was wrong it will raise an error of this list:
```ruby
GeoNames::AuthorizationExceptionError
GeoNames::DatabaseTimeoutError
GeoNames::MissingOrInvalidParameterError
GeoNames::RecordDoesNotExistError
GeoNames::OtherError
GeoNames::NoResultFoundError
GeoNames::PostalCodeNotFoundError
GeoNames::DailyLimitOfCreditsExceededError
GeoNames::HourlyLimitOfCreditsExceededError
GeoNames::WeeklyLimitOfCreditsExceededError
GeoNames::InvalidInputError
GeoNames::ServerOverloadedExceptionError
GeoNames::ServiceNotImplementedError
GeoNames::RadiusTooLargeError
GeoNames::MaxRowsTooLargeError
GeoNames::StatusCodeNotImplementedError
```

#### Search engines available

```ruby
GeoNames::Address
GeoNames::Astergdem
GeoNames::Children
GeoNames::Cities
GeoNames::Configuration
GeoNames::Contains
GeoNames::CountryCode
GeoNames::CountryInfo
GeoNames::CountrySubdivision
GeoNames::Earthquakes
GeoNames::ExtendedFindNearby
GeoNames::FindNearByWeather
GeoNames::FindNearby
GeoNames::FindNearbyPOIsOSM
GeoNames::FindNearbyPlaceName
GeoNames::FindNearbyPostalCodes
GeoNames::FindNearbyStreets
GeoNames::FindNearbyStreetsOSM
GeoNames::FindNearbyWikipedia
GeoNames::FindNearestAddress
GeoNames::FindNearestIntersection
GeoNames::FindNearestIntersectionOSM
GeoNames::GeoCodeAddress
GeoNames::Get
GeoNames::Gtopo30
GeoNames::Hierarchy
GeoNames::Neighbourhood
GeoNames::Neighbours
GeoNames::Ocean
GeoNames::PostalCodeCountryInfo
GeoNames::PostalCodeLookup
GeoNames::PostalCodeSearch
GeoNames::Search
GeoNames::Siblings
GeoNames::Srtm1
GeoNames::Srtm3
GeoNames::Timezone
GeoNames::Weather
GeoNames::WeatherIcao
GeoNames::WikipediaBoundingBox
GeoNames::WikipediaSearch
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
