class Evacuator < ActiveRecord::Base

  def self.in_radius(latitude, longitude, radius = 500)
    where("ST_DWithin(location, ST_GeographyFromText('POINT(#{latitude} #{longitude})'), #{radius})")
    # where("ST_Distance_Sphere(location, ST_MakePoint(#{longitude},#{latitude})) <= #{radius}")

  end
end
