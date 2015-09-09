 class Road

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

  def front_right
    return @front_right if @front_right
    @front_right = []
    @front_right << (Math.cos(@angle.degrees)  * WIDTH) + @x1
    @front_right << (Math.sin(@angle.degrees) * WIDTH) + @y1
    @front_right
  end

  def front_left
    return @front_left if @front_left
    @front_left = []
    @front_left << (Math.cos(@angle.degrees) * (WIDTH * -1)) + @x1
    @front_left << (Math.sin(@angle.degrees) * (WIDTH * -1)) + @y1
    @front_left
  end

  def back_right
    return @back_right if @back_right
    @back_right = []
    @back_right << (Math.cos(@angle.degrees)  * WIDTH) + @x2
    @back_right << (Math.sin(@angle.degrees) * WIDTH) + @y2
    @back_right
  end

  def back_left
    return @back_left if @back_left
    @back_left = []
    @back_left << (Math.cos(@angle.degrees) * (WIDTH * -1)) + @x2
    @back_left << (Math.sin(@angle.degrees) * (WIDTH * -1)) + @y2
    @back_left
  end
  
end