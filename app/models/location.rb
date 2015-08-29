class Location < ActiveRecord::Base
  extend Geocoder::Model::ActiveRecord
  # reverse_geocoded_by :latitude, :longitude
  # after_validation :reverse_geocode  # auto-fetch address

  def distance(other_location)
    Geocoder::Calculations.distance_between([latitude, longitude], [other_location.latitude, other_location.longitude])
  end
end