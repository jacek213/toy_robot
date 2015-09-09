module ToyRobot
  class Robot
    attr_reader :table, :position

    ROTATION_MAPPING = {
      west: { left: :south, right: :north },
      south: { left: :east, right: :west },
      east: { left: :north, right: :south },
      north: { left: :west, right: :east }
    }

    def initialize(table)
      @table = table
      @position = nil
    end

    def place(coords)
      if table.valid_coordinates?(coords)
        @position = Position.new(coords)
      end
    end

    def move
      return unless placed?
      case @position.orientation
      when :west
        coords = {x: @position.x - 1, y: @position.y}
        move_if_valid(coords)
      when :east
        coords = {x: @position.x + 1, y: @position.y}
        move_if_valid(coords)
      when :south
        coords = {x: @position.x, y: @position.y - 1}
        move_if_valid(coords)
      when :north
        coords = {x: @position.x, y: @position.y + 1}
        move_if_valid(coords)
      end
    end

    def rotate(direction)
      return unless placed?
      @position.orientation = ROTATION_MAPPING[@position.orientation][direction]
    end

    def report
      return unless placed?
      STDERR.puts "#{@position.x},#{@position.y},#{@position.orientation}\n"
    end

    private

    def set_coordinates(coords)
      params = coords.merge(orientation: @position.orientation)
      @position = Position.new(params)
    end

    def move_if_valid(coords)
      if table.valid_coordinates?(coords)
        set_coordinates(coords)
      end
    end

    def placed?
      !@position.nil?
    end
  end
end
