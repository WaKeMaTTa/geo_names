# frozen_string_literal: true

module GeoNames
  class Children < Base
    def required_param_names
      %i[geonameId]
    end
  end
end
