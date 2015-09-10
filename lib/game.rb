require 'gosu'

Dir[File.join(File.dirname(__FILE__), '*', '*.rb')].each { |file| require file }
Dir[File.join(File.dirname(__FILE__), '*.rb')].each { |file| require file }


class Game < Gosu::Window

  include GameComponents::Initialisers
  include GameComponents::Border

  attr_accessor :vehicles, :roads, :junctions
  attr_accessor :debug_junctions

  def initialize(width=683, height=384)
    super width, height, {}
    self.caption = "AutoCars"
    self.vehicles = []
    self.roads = []
    self.junctions = []
  end

  def update
    vehicles.each { |v| v.update }
  end

  def button_down(id)
    vehicles.each do |ob|
      ob.button_down(id)
    end
    if id == Gosu::KbEscape
      close
    end
  end

  def button_up(id)
    vehicles.each do |ob|
      ob.button_up(id)
    end
  end

  def draw
    roads.each { |v| v.draw }
    vehicles.each { |v| v.draw }
    junctions.each { |v| v.draw } if @debug_junctions
  end

  def show
    connect_roads
    super
  end

end