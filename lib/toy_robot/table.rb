module ToyRobot
  class Table
    attr_reader :width, :height

    def initialize(width, height)
      @width, @height = width, height
    end

    def valid_position?(position)
      valid_x?(position.x) && valid_y?(position.y)
    end

    private

    def valid_x?(point)
      0 <= point && point <= width - 1
    end

    def valid_y?(point)
      0 <= point && point <= height - 1
    end
  end
end
