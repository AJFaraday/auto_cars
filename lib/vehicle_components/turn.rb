module VehicleComponents

  module Turn

    # wheel angle up to 45 deg
    # do not turn if stationary
    # at slower speeds, turn more sharply
    # faster, wider turning curve

    def turn
      turn_angle = wheel_angle * (speed / 10)
      turn_angle /= 100
      @angle += turn_angle
    end

  end

end