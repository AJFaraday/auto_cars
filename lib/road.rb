class Road

  include RoadComponents::Corners
  include RoadComponents::Connection

  COLOUR = Gosu::Color::GRAY
  WIDTH = 40

  attr_accessor :x1, :y1, :X2, :y2
  attr_accessor :game, :quads

  def initialize(game, x1=100, y1=100, x2=100, y2=300)
    @game = game
    @x1, @y1, @x2, @y2 = x1, y1, x2, y2
    @angle = Gosu.angle(@x1, @y1, @x2, @y2)
    @quads = []
    @quads << [
      front_right, front_left,
      back_right, back_left
    ]
  end

  def draw
    quads.each do |quad|
      Gosu.draw_quad(
        quad[0][0], quad[0][1], Road::COLOUR,
        quad[1][0], quad[1][1], Road::COLOUR,
        quad[2][0], quad[2][1], Road::COLOUR,
        quad[3][0], quad[3][1], Road::COLOUR,
        Layer[:road]
      )
    end

    Gosu.draw_line(
      @x1, @y1, Gosu::Color::WHITE,
      @x2, @y2, Gosu::Color::WHITE,
      Layer[:road_paint]
    )
  end


end