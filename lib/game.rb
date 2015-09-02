require 'gosu'

Dir[File.join(File.dirname(__FILE__), '*','*.rb')].each { |file| require file }
Dir[File.join(File.dirname(__FILE__), '*.rb')].each { |file| require file }


class Game < Gosu::Window

  include GameComponents::Initialisers

  attr_accessor :vehicles, :roads

  def initialize
    super 683, 384, {}
    self.caption = "AutoCars"
    self.vehicles = []
    self.roads = []
  end

  def update
    vehicles.each{|v|v.update}
  end

  def button_down(id)
    vehicles.each do |ob|
      ob.button_down(id)
    end
  end

  def draw
    roads.each{|v|v.draw}
    vehicles.each{|v|v.draw}
  end

end