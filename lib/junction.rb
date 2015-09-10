class Junction

  attr_accessor :x, :y, :game

  IMAGE = Gosu::Image.new(
    File.join(
      File.dirname(__FILE__),
      '..', 'images',
      'junction.png'
    )
  )

  def initialize(game, x, y)
    @game, @x, @y = game, x, y
  end

  def draw
    IMAGE.draw_rot(
      @x, @y, Layer[:debug], 0
    )
  end

end