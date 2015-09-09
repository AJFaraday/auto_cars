require 'yaml'

class Vehicle

  include VehicleComponents::Accelerate
  include VehicleComponents::Move
  include VehicleComponents::Wheels
  include VehicleComponents::Turn

  attr_accessor :game, :controller
  attr_accessor :x, :y, :angle

  def initialize(game, x, y, angle, profile)
    @game = game
    @wheels = []
    @x, @y, @angle = x, y, angle
    @profile = VehicleProfile.fetch(profile)
    @controller = eval("VehicleControllers::#{@profile.controller}.new(self)")
    if @profile.display_class
      @display = eval("VehicleDisplays::#{@profile.display_class}.new(self)")
    end
    init_acceleration
    init_wheels
  end

  def update
    accelerate
    move
    turn_wheels
    turn

    @display.update if @display
  end

  def button_down(id)
    controller.button_down(id) if controller.respond_to?(:button_down)
  end

  def button_up(id)
    controller.button_up(id) if controller.respond_to?(:button_up)
  end
  
  def draw
    image.draw_rot(x, y, Layer[:vehicle], angle)
    @display.draw if @display
  end

  def image
    @profile.image
  end

  def method_missing(meth, *args, &block)
    if @profile and @profile.attrs and @profile.attrs[meth.to_s]
      return @profile.attrs[meth.to_s]
    end
    super
  end

end