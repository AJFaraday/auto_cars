module VehicleDisplays
  class Guage

    GUAGE_IMAGE = Gosu::Image.new(
      Gosu::Image.new(
        File.join(
          File.dirname(__FILE__),
          '..', '..', 'images', 'guage.png'
        )
      )
    )

    attr_accessor :x, :y, :needles, :vehicle

    def initialize(vehicle, x, y)
      @vehicle = vehicle
      @x = x
      @y = y
      @needles = [
        VehicleDisplays::Needle.new(self, 'speed', 'red'),
        VehicleDisplays::Needle.new(self, 'target_speed', 'green')
      ]
    end

    def draw
      @needles.each { |needle| needle.draw }
      VehicleDisplays::Guage::GUAGE_IMAGE.draw(
        @x, @y, Layer[:display]
      )
    end

    def update
      @needles.each { |needle| needle.update }
    end

  end
end