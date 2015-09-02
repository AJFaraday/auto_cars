module VehicleComponents

  module Turn

    # wheel angle up to 45 deg
    # do not turn if stationary
    # at slower speeds, turn more sharply
    # faster, wider turning curve

    def turn
      if @speed > 0.1
        turn_angle = wheel_angle.to_f * (1 / (speed.to_f))
        @angle += turn_angle
      end
    end

  end

end