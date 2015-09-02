require 'yaml'

class Vehicle

  include VehicleComponents::Accelerate
  include VehicleComponents::Move
  #include VehicleComponents::Wheels
  #include VehicleComponents::Turn

  attr_accessor :game, :wheels, :controller
  attr_accessor :x, :y, :angle

  def initialize(game, x, y, angle, profile)
    @game = game
    @wheels = []
    @x, @y, @angle = x, y, angle
    @profile = VehicleProfile.fetch(profile)
    @controller = eval("VehicleControllers::#{@profile.controller}.new(self)")
    init_acceleration
  end

  def update
    accelerate
    move
    # wheel_turn
    # turn
  end

  def button_down(id)
    controller.button_down(id) if controller.respond_to?(:button_down)
  end

  def draw
    image.draw_rot(x, y, 1, angle)
  end

  def image
    @profile.image
  end

end