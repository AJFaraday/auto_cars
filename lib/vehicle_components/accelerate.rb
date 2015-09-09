module VehicleComponents

  module Accelerate

    # speed        - pixels per frame
    # target_speed -   "     "    "
    # acceleration - decipixels per frame per frame
    #                (from profile)

    attr_accessor :speed, :target_speed, :braking

    def init_acceleration
      @speed = 0.0
      @target_speed = 0.0
    end

    def accelerate
      if @braking and @speed > 0
        @speed -= (@speed < braking_speed ? @speed : braking_speed)
      elsif @accelerating and @speed < @target_speed
        @speed += acceleration
      elsif @accelerating and @speed > @target_speed
        @speed -= slowing_speed
      elsif @speed >= 0
        @speed -= (@speed < slowing_speed ? @speed : slowing_speed)
      end
    end

    def acceleration
      @profile.acceleration.to_f / 10
    end

    def slowing_speed
      @profile.acceleration.to_f / 5
    end

  end

end