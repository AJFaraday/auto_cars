module VehicleComponents

  module Accelerate

    # speed        - pixels per frame
    # target_speed -   "     "    "
    # acceleration - pixels per frame per frame
    #                (from profile)

    attr_accessor :speed, :target_speed

    def init_acceleration
      @speed = 0
      @target_speed = 0
    end

    def accelerate
      if @speed < @target_speed
        @speed += acceleration
      elsif @speed > @target_speed
        @speed -= acceleration
      end
    end

    def acceleration
      @profile.acceleration
    end

  end

end