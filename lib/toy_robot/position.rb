module ToyRobot
  class Position
    attr_accessor :orientation, :x, :y

    ROTATION_MAPPING = {
      west: { left: :south, right: :north },
      south: { left: :east, right: :west },
      east: { left: :north, right: :south },
      north: { left: :west, right: :east }
    }

    def self.step_ahead(position)
      stepped = position.clone
      case stepped.orientation
      when :north then stepped.y += 1
      when :south then stepped.y -= 1
      when :east  then stepped.x += 1
      when :west  then stepped.x -= 1
      end
      stepped
    end

    def initialize(opts)
      @x = opts[:x]
      @y = opts[:y]
      @orientation = opts[:orientation]
    end

    def rotate(direction)
      self.orientation = ROTATION_MAPPING[orientation][direction]
    end
  end
end
