class Location < ActiveRecord::Base
  has_many :schools
  attr_reader :latitude, :longitude

 def initialize(lat, long)
   @latitude = lat
   @longitude = long
 end

  def -(other_location)
    longitude_sqr = (@longitude - other_location.longitude).abs ** 2
    latitude_sqr = (@latitude - other_location.latitude).abs ** 2
    Math.sqrt(longitude_sqr + latitude_sqr)
  end
  
  def to_s
    "[#{@latitude}, #{@longitude}]"
  end
end