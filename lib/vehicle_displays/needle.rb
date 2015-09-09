module VehicleDisplays

  class Needle

    attr_accessor :vehicle, :attribute

    def initialize(guage, attribute, colour)
      @guage = guage
      @vehicle = guage.vehicle
      @start_x = @guage.x + 50
      @start_y = @guage.y + 55
      @attribute = attribute
      @image = Gosu::Image.new(
        File.join(
          File.dirname(__FILE__),
          '..','..',
          'images', "#{colour}-needle.png"
        )
      )
      @angle = 0.0
    end

    def update
      raw_value = vehicle.send(attribute)
      @angle = ((raw_value - 50.0) / 50.0) * 45.0
    end

    def draw
      @image.draw_rot(
        @start_x, @start_y, Layer[:display],
        @angle,
        0.5, 0.9
      )
    end

  end

end