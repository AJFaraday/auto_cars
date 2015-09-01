module GameComponents

  module Initialisers

    def add_vehicle(x, y, angle, profile)
      vehicles << Vehicle.new(self, x, y, angle, profile)
    end

  end

end