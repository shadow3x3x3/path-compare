class Driver

  def initialize location_array
    @locations = location_array
    @sum       = 0
  end

  def route_info
    puts "          *********** Driver's locations ***********"
    clac_distance
    clac_duration
  end

  def clac_distance
    distance = 0

    @locations.each_with_index do |location, index|
      unless index == 0
        distance += get_distance_with_pyth location, @locations[index - 1]
      end
    end

    puts "The distance: #{distance * 111} km"
  end

  def clac_duration
    duration = 0
    @locations.each_with_index do |location, index|
      unless index == 0
        duration +=
          DateTime.strptime("#{location[2]}+08:00", "%Y-%m-%d-%H-%M-%S%z") - DateTime.strptime("#{@locations[index - 1][2]}+08:00", "%Y-%m-%d-%H-%M-%S%z")
      end
    end

    puts "The duration: #{(duration * 24 * 60 * 60).to_i / 3600}H  #{(duration * 24 * 60 * 60).to_i % 60}M "
  end

  def stay_times
  end


  private

  def get_distance_with_pyth one_side, anothre_side
    Math.sqrt(((one_side[0] - anothre_side[0]) ** 2) + ((one_side[1] - anothre_side[1]) ** 2))
  end


end
