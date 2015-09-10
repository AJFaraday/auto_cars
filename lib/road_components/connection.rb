module RoadComponents

  module Connection

    def connect_to_neighbours
      neighbours = get_neighbours
      neighbours.each do |neighbour|
        links = get_links_for(neighbour)
        links.each_slice(2) do |links|
          quad = [
            [links[0][:x1], links[0][:y1]],
            [links[0][:x2], links[0][:y2]],
            [links[1][:x1], links[1][:y1]],
            [links[1][:x2], links[1][:y2]]
          ]
          self.quads << quad
          build_junction(quad)
        end
      end
    end

    def get_links_for(neighbour)
      links = []
      self.corners.each do |corner|
        neighbour.corners.each do |other_corner|
          link = {
            :x1 => corner[0],
            :y1 => corner[1],
            :x2 => other_corner[0],
            :y2 => other_corner[1]
          }
          link[:distance] = Gosu.distance(
            link[:x1], link[:y1],
            link[:x2], link[:y2]
          )
          links << link
        end
      end
      links.sort! { |x, y| x[:distance] <=> y[:distance] }
      links[0..1]
    end

    def get_neighbours
      neighbours = other_roads.select do |road|
        self.corners.any? do |corner|
          road.corners.any? do |other_corner|
            dist = Gosu.distance(
              corner[0], corner[1],
              other_corner[0], other_corner[1]
            )
            dist <= (Road::WIDTH * 2)
          end
        end
      end
      neighbours
    end

    def other_roads
      game.roads.reject { |x| x == self }
    end

    def build_junction(quad)
      xs = quad.collect{|coord| coord[0]}
      ys = quad.collect{|coord| coord[1]}
      game.add_junction(xs.mean,ys.mean)
    end

  end

end