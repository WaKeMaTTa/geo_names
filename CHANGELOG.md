# CHANGELOG

## Unreleased

- ...

## 1.0.2

- GeoNames API changed the behavior and now we need to rescue RestClient::Unauthorized exception. [Pr #4](https://github.com/WaKeMaTTa/geo_names/pull/4)
- Fixed missing `GeoNames::DatabaseTimeoutError` class and fixed a typo in the class `GeoNames::NoResultFoundError`. [Pr #3](https://github.com/WaKeMaTTa/geo_names/pull/3) (thanks to @dgilperez)

## 1.0.1

- A typo in `GeoNames.configuration` -> `username`. [commit 8d8d7e3](https://github.com/WaKeMaTTa/geo_names/commit/8d8d7e3329cc4ca08209d3d99f1263c665d51135)

## 1.0.0

- First release
