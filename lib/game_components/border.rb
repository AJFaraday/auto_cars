module GameComponents
  
  module Border

    BORDER_SIZE = 20

    def border_left
      0 - BORDER_SIZE
    end

    def border_right
      width + BORDER_SIZE
    end

    def border_top
      0 - BORDER_SIZE
    end

    def border_bottom
      height + BORDER_SIZE
    end
    
  end
  
end