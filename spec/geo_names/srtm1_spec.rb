# frozen_string_literal: true

RSpec.describe GeoNames::Srtm1 do
  before :each do
    GeoNames.configuration.username = nil
  end

  let(:username) { 'gem_geo_names' }

  it 'raises an error on empty username' do
    RSpec::Expectations.configuration.on_potential_false_positives = :nothing
    GeoNames.configuration.username = nil
    expect do
      GeoNames::Srtm1.search
    end.to raise_error(GeoNames::AuthorizationExceptionError)
  end

  it 'do not raises an error if username is in the options' do
    GeoNames.configuration.username = nil
    expect do
      GeoNames::Srtm1.search(username: username)
    end.not_to raise_error(GeoNames::AuthorizationExceptionError)
  end

  it 'works' do
    GeoNames.configuration.username = username
    expect do
      GeoNames::Srtm1.search
    end.to raise_error(GeoNames::MissingOrInvalidParameterError)
  end
end
