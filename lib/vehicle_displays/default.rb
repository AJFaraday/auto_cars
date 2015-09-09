module VehicleDisplays

  module Default

    def console_readout
      puts "Speed: #{@vehicle.speed}"
      puts "Target Speed: #{@vehicle.target_speed}"
      puts "Wheel angle: #{@vehicle.wheel_angle}"
      puts ''
    end

  end

end