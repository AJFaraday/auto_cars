 class Road

  include RoadComponents::Corners

  COLOUR = Gosu::Color::GRAY
  WIDTH = 40

  attr_accessor :x1, :y1, :X2, :Y2

  def initialize(x1=100,y1=100,x2=100,y2=300)
    @x1, @y1, @x2, @y2 = x1, y1, x2, y2
    @angle = Gosu.angle(@x1, @y1, @x2, @y2)
    puts @angle
  end

  def draw
    Gosu.draw_quad(
      front_left[0], front_left[1], Road::COLOUR,
      front_right[0], front_right[1], Road::COLOUR,
      back_left[0], back_left[1], Road::COLOUR,
      back_right[0], back_right[1], Road::COLOUR,
      Layer[:road]
    )

    # TODO remove once debugged
    Gosu.draw_line(
      @x1, @y1, Gosu::Color::WHITE,
      @x2, @y2, Gosu::Color::WHITE,
      Layer[:road_paint]
    )
  end
  
end