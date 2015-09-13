module ToyRobot
  class Robot
    attr_reader :table, :position

    def initialize(table)
      @table = table
      @position = nil
    end

    def place(coords)
      placement = Position.new(coords)
      set_position_if_valid(placement)
    end

    def move
      return unless placed?
      placement = Position.step_ahead(position)
      set_position_if_valid(placement)
    end

    def rotate(kind)
      return unless placed?
      position.rotate(kind)
    end

    def report
      return unless placed?
      position.to_s
    end

    private

    def set_position_if_valid(placement)
      if table.valid_position?(placement)
        @position = placement
      end
    end

    def placed?
      !position.nil?
    end
  end
end
