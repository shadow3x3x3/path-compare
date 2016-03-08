class GoogleDirectionApi

  Google_direction_url = 'http://maps.googleapis.com/maps/api/directions/json?'

  # attr_accessor :dest_address, :ori_address

  def set_location(ori_address, dest_address)
    @ori_longitude   = ori_address[0]
    @ori_latitude    = ori_address[1]
    @dest_longitude  = dest_address[0]
    @dest_latitude   = dest_address[1]

    @json            = get_json_fromAPI
  end

  def route_info
    puts "Start form #{get_start_address} to #{get_dest_address}"
    puts ""
    puts "          *********** Googole Direction API ***********"
    puts "url: #{combine_url}"
    puts ""
    puts get_distance
    puts get_duration
  end

  def combine_url
    origin      = "&origin=#{@ori_latitude},#{@ori_longitude}"
    destination = "&destination=#{@dest_latitude},#{@dest_longitude}"
    mode        = "&mode=drive"
    language    = "&language=zh-TW"
    "#{Google_direction_url}#{destination}#{origin}#{mode}#{language}"
  end

  def get_duration
    "The duration: #{@json["routes"][0]["legs"][0]["duration"]["text"]}"
  end

  def get_distance
    "The distance: #{@json["routes"][0]["legs"][0]["distance"]["text"]}"
  end

  def get_start_address
    @json["routes"][0]["legs"][0]["start_address"]
  end

  def get_dest_address
    @json["routes"][0]["legs"][0]["end_address"]
  end

  def get_json_fromAPI
    json_object = JSON.parse(open(combine_url).read)
    json_object
  end

end