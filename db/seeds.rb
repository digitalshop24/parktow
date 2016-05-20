COORDINATES_OF_DSHOP24_OFFICE = [53.881757, 27.561157]
RADIUS_IN_DEGRESS = 0.05
EVAUATORS_NUMBER = 100
DEVICES_NUMBER = 100
MAX_PARKINGS_PER_DEVISE = 10

puts 'destroying of all entries...'
Parking.destroy_all
Device.destroy_all
Evacuator.destroy_all

puts "creating evacuators..."
puts "#{EVAUATORS_NUMBER} evacuators in Minsk"
EVAUATORS_NUMBER.times do
  latitude = COORDINATES_OF_DSHOP24_OFFICE[0] + rand(-RADIUS_IN_DEGRESS..RADIUS_IN_DEGRESS)
  longitude = COORDINATES_OF_DSHOP24_OFFICE[1] + rand(-RADIUS_IN_DEGRESS..RADIUS_IN_DEGRESS)
  Evacuator.create(
    last_seen: Time.now - rand(0..86400).seconds,
    location: "POINT(#{latitude} #{longitude})"
  )
end

puts "creating devices..."
puts "#{DEVICES_NUMBER} devices. Every device with max #{MAX_PARKINGS_PER_DEVISE} parkings (only 1 active)"
DEVICES_NUMBER.times do |i|
  i += 1
  device = Device.create(
    token: i
  )
  latitude = COORDINATES_OF_DSHOP24_OFFICE[0] + rand(-RADIUS_IN_DEGRESS..RADIUS_IN_DEGRESS)
  longitude = COORDINATES_OF_DSHOP24_OFFICE[1] + rand(-RADIUS_IN_DEGRESS..RADIUS_IN_DEGRESS)
  rand(0..MAX_PARKINGS_PER_DEVISE).times do
    device.parkings.create(
      location: "POINT(#{latitude} #{longitude})"
    )
  end
end
