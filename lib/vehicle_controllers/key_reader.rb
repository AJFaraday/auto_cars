module VehicleControllers

  class KeyReader

    TARGET_SPEEDS = [
      Gosu::KbBacktick,
      Gosu::Kb1, Gosu::Kb2, Gosu::Kb3, Gosu::Kb4,
      Gosu::Kb5, Gosu::Kb6, Gosu::Kb7, Gosu::Kb8,
      Gosu::Kb9, Gosu::Kb0
    ]

    TARGET_INTERVAL = 10

    attr_accessor :vehicle

    def initialize(vehicle)
      @vehicle = vehicle
    end

    def button_down(id)
      set_target_speed(TARGET_SPEEDS.index(id)) if TARGET_SPEEDS.index(id)
    end

    def set_target_speed(index)
      vehicle.target_speed = TARGET_INTERVAL * index
    end

  end

end