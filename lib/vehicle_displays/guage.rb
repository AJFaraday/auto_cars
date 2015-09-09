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

    attr_accessor :x, :y, :needles

    def initialize(x, y)
      @x = x
      @y = y
    end

    def draw
      VehicleDisplays::Guage::GUAGE_IMAGE.draw(
        @x, @y, Layer[:display]
      )
      @needles.each{|name, needle|needle.draw}
    end

  end
end