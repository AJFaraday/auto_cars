module GameComponents

  module Initialisers

    def add_vehicle(x, y, angle, profile)
      vehicles << Vehicle.new(self, x, y, angle, profile)
    end

    def add_road(x1, y1, x2, y2)
      roads << Road.new(x1, y1, x2, y2)
    end

  end

end