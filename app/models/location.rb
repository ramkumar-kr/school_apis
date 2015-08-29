class Location < ActiveRecord::Base

  attr_reader :latitude, :longitude

  def initialize(coordinates)
    @latitude = coordinates[:latitude]
    @longitude = coordinates[:longitude]
    super
  end

  def distance(other_location)
    km(@latitude, @longitude, other_location[:latitude], other_location[:longitude])
  end

  def km(lat1, lon1, lat2, lon2)
    dlon = rad(lon2 - lon1)
    dlat = rad(lat2 - lat1)
    a = (Math.sin(dlat/2) ** 2) + Math.cos(rad(lat1)) * Math.cos(rad(lat2)) * (Math.sin(dlon/2) ** 2 )
    c = 2 * Math.atan2( Math.sqrt(a), Math.sqrt(1-a) ) 
    d = 6371 * c
  end

  def rad(degrees)
    degrees * Math::PI / 180
  end
  
  def to_s
    "[#{@latitude}, #{@longitude}]"
  end
end