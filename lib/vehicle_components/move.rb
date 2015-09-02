module VehicleComponents

  module Move

    def move
      speed = @speed / 10
      @x += Gosu::offset_x(@angle, speed)
      @y += Gosu::offset_y(@angle, speed)
      loop_back
    end

    def loop_back
      if @x < game.border_left
        @x = game.border_right
      elsif @x > game.border_right
        @x = game.border_left
      end
      if @y < game.border_top
        @y = game.border_bottom
      elsif @y > game.border_bottom
        @y = game.border_top
      end
    end

  end

end