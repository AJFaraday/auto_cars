module RoadComponents

  module Corners

    def front_right
      return @front_right if @front_right
      @front_right = []
      @front_right << (Math.cos(@angle.degrees) * Road::WIDTH) + @x1
      @front_right << (Math.sin(@angle.degrees) * Road::WIDTH) + @y1
      @front_right
    end

    def front_left
      return @front_left if @front_left
      @front_left = []
      @front_left << (Math.cos(@angle.degrees) * (Road::WIDTH * -1)) + @x1
      @front_left << (Math.sin(@angle.degrees) * (Road::WIDTH * -1)) + @y1
      @front_left
    end

    def back_right
      return @back_right if @back_right
      @back_right = []
      @back_right << (Math.cos(@angle.degrees) * Road::WIDTH) + @x2
      @back_right << (Math.sin(@angle.degrees) * Road::WIDTH) + @y2
      @back_right
    end

    def back_left
      return @back_left if @back_left
      @back_left = []
      @back_left << (Math.cos(@angle.degrees) * (Road::WIDTH * -1)) + @x2
      @back_left << (Math.sin(@angle.degrees) * (Road::WIDTH * -1)) + @y2
      @back_left
    end

    def corners
      [
        front_right,
        front_left,
        back_left,
        back_right
      ]
    end

    def front
      [@x1, @y1]
    end

    def back
      [@x2, @y2]
    end

    def ends
      [front, back]
    end

  end

end