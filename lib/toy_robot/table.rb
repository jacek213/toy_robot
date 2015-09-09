module ToyRobot

  class Table
    attr_reader :width, :height

    def initialize(width, height)
      @width, @height = width, height
    end

    def valid_coordinates?(coords)
      valid_x_position?(coords[:x]) && valid_y_position?(coords[:y])
    end

    private

    def valid_x_position?(point)
      0 <= point && point <= width - 1
    end

    def valid_y_position?(point)
      0 <= point && point <= height - 1
    end
  end
end
