# frozen_string_literal: true

require 'json'
require 'rest_client'

module GeoNames
  class Base
    attr_reader :url, :params

    def self.search(params = {})
      new(params).call
    end

    def initialize(params = {})
      @url = "#{configuration.api_base}#{controller_name_for(self.class)}"
      @params = {
        username: configuration.username
      }.merge(params)
    end

    def call
      result = make_request
      parse(result)
    end

    private

    def configuration
      @configuration ||= GeoNames.configuration
    end

    def make_request
      RestClient.get(url, params: params)
    end

    def parse(json_string)
      hash = JSON.parse(json_string)
      return hash unless hash['status']

      status_code = hash.dig('status', 'value')
      message     = hash.dig('status', 'message')
      raise_error_according_to!(status_code, message)
    end

    def controller_name_for(klass)
      name = klass.to_s.sub('GeoNames::', '')
      name_camelized = name.chars.map.with_index do |char, index|
        index.zero? ? char.downcase : char
      end.join
      "#{name_camelized}JSON"
    end

    def raise_error_according_to!(status_code, message)
      case status_code
      when 10
        raise(AuthorizationExceptionError, message)
      when 11
        raise(RecordDoesNotExistError, message)
      when 12
        raise(OtherError, message)
      when 13
        raise(DatabaseTimeoutError, message)
      when 13
        raise(DatabaseTimeoutError, message)
      when 14
        raise(MissingOrInvalidParameterError, message)
      when 15
        raise(NoResultFoundrError, message)
      when 16
        raise(DuplicateExceptionError, message)
      when 17
        raise(PostalCodeNotFoundError, message)
      when 18
        raise(DailyLimitOfCreditsExceededError, message)
      when 19
        raise(HourlyLimitOfCreditsExceededError, message)
      when 20
        raise(WeeklyLimitOfCreditsExceededError, message)
      when 21
        raise(InvalidInputError, message)
      when 22
        raise(ServerOverloadedExceptionError, message)
      when 23
        raise(ServiceNotImplementedError, message)
      when 24
        raise(RadiusTooLargeError, message)
      when 25
        raise(MaxRowsTooLargeError, message)
      else
        raise(StatusCodeNotImplementedError, 'please report it in github.com/wakematta/geo_names')
      end
    end
  end

  class AuthorizationExceptionError            < StandardError; end
  class MissingOrInvalidParameterError         < StandardError; end
  class RecordDoesNotExistError                < StandardError; end
  class OtherError                             < StandardError; end
  class NoResultFoundrError                    < StandardError; end
  class PostalCodeNotFoundError                < StandardError; end
  class DailyLimitOfCreditsExceededError       < StandardError; end
  class HourlyLimitOfCreditsExceededError      < StandardError; end
  class WeeklyLimitOfCreditsExceededError      < StandardError; end
  class InvalidInputError                      < StandardError; end
  class ServerOverloadedExceptionError         < StandardError; end
  class ServiceNotImplementedError             < StandardError; end
  class RadiusTooLargeError                    < StandardError; end
  class MaxRowsTooLargeError                   < StandardError; end
  class StatusCodeNotImplementedError          < StandardError; end
end
