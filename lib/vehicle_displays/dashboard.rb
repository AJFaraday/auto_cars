module VehicleDisplays

  class Dashboard

    include VehicleDisplays::Default

    def initialize(vehicle)
      @vehicle = vehicle
      @game = vehicle.game
      @guage = VehicleDisplays::Guage.new(10, @game.height - 60)
    end

    def draw
      console_readout if (Gosu.milliseconds % 1000) < 20
      @guage.draw
    end

  end

end