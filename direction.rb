require 'open-uri'
require 'json'
require_relative 'google_direction_api'
require_relative 'driver'

ori_address  = [121.5126642, 25.0474795]
dest_address = [120.6394465, 24.1687984]

# Direction form Google
direction = GoogleDirectionApi.new
direction.set_location ori_address, dest_address
direction.route_info

puts ""
puts ""

# Direction form Driver
location_array = []
location = []

content = File.read("2015-11-08-19-20-04_location.txt").split(" ")

content.each_with_index do |elem, index|
  elem = elem.to_f unless index % 3 == 2
  location << elem
  if index % 3 == 2
    location_array << location
    location = []
  end

end

driver = Driver.new location_array
duration = DateTime.strptime("#{location_array[1][2]}+08:00", "%Y-%m-%d-%H-%M-%S%z") - DateTime.strptime("#{location_array[0][2]}+08:00", "%Y-%m-%d-%H-%M-%S%z")
driver.route_info

puts ""
