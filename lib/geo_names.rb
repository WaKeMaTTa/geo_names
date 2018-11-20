# frozen_string_literal: true

require 'geo_names/version'
require 'geo_names/base'
require 'geo_names/address'
require 'geo_names/astergdem'
require 'geo_names/children'
require 'geo_names/cities'
require 'geo_names/contains'
require 'geo_names/country_code'
require 'geo_names/country_info'
require 'geo_names/country_subdivision'
require 'geo_names/earthquakes'
require 'geo_names/extended_find_nearby'
require 'geo_names/find_nearby_place_name'
require 'geo_names/find_nearby_po_is_osm'
require 'geo_names/find_nearby_postal_codes'
require 'geo_names/find_nearby'
require 'geo_names/find_nearby_streets_osm'
require 'geo_names/find_nearby_streets'
require 'geo_names/find_near_by_weather'
require 'geo_names/find_nearby_wikipedia'
require 'geo_names/find_nearest_address'
require 'geo_names/find_nearest_intersection_osm'
require 'geo_names/find_nearest_intersection'
require 'geo_names/geo_code_address'
require 'geo_names/get'
require 'geo_names/gtopo30'
require 'geo_names/hierarchy'
require 'geo_names/neighbourhood'
require 'geo_names/neighbours'
require 'geo_names/ocean'
require 'geo_names/postal_code_country_info'
require 'geo_names/postal_code_lookup'
require 'geo_names/postal_code_search'
require 'geo_names/search'
require 'geo_names/siblings'
require 'geo_names/srtm1'
require 'geo_names/srtm3'
require 'geo_names/timezone'
require 'geo_names/version'
require 'geo_names/weather_icao'
require 'geo_names/weather'
require 'geo_names/wikipedia_bounding_box'
require 'geo_names/wikipedia_search'


module GeoNames
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration) if block_given?
  end

  # Main configuration class.
  class Configuration
    attr_accessor :api_base, :username

    def initialize
      @api_base = 'http://api.geonames.org/'
      @username = nil
    end
  end
end
