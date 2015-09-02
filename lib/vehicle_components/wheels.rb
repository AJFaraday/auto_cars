module VehicleComponents

  module Wheels

    MAX_WHEEL_ANGLE = 45
    MIN_WHEEL_ANGLE = -45

    attr_accessor :wheel_angle, :turning_right, :turning_left

    def init_wheels
      @wheel_angle = 0.0
    end

    def turn_wheels
      turn_speed = @profile.turn_speed.to_f
      if turning_right and wheel_angle_in_range?
        @wheel_angle += turn_speed
      elsif turning_left and wheel_angle_in_range?
        @wheel_angle -= turn_speed
      elsif @wheel_angle > 0
        @wheel_angle -= turn_speed
      elsif @wheel_angle < 0
        @wheel_angle += turn_speed
      end
    end

    def wheel_angle_in_range?
      @wheel_angle < MAX_WHEEL_ANGLE and
        @wheel_angle > MIN_WHEEL_ANGLE
    end

  end

end