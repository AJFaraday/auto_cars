require 'yaml'

class Vehicle

  attr_accessor :game, :wheels
  attr_accessor :x, :y, :angle

  def initialize(game, x, y, angle, profile)
    @game = game
    @wheels = []
    @x, @y, @angle = x, y, angle
    @profile = VehicleProfile.fetch(profile)
    puts @profile
  end

  def update
    
  end

  def draw
    image.draw_rot(x, y, 1, angle)
  end

  def image
    @profile.image
  end

end