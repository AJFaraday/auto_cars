module GameComponents

  module Initialisers

    def add_vehicle(x, y, angle, profile)
      vehicles << Vehicle.new(self, x, y, angle, profile)
    end

    def add_road(x1, y1, x2, y2)
      roads << Road.new(self, x1, y1, x2, y2)
    end

    def connect_roads
      roads.each do |road|
        road.connect_to_neighbours
      end
    end

    def add_junction(x,y)
      junctions << Junction.new(self, x, y)
    end

  end

end