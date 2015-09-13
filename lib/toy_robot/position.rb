module ToyRobot
  class Position
    attr_accessor :direction, :x, :y

    DIRECTIONS = [:north, :east, :south, :west]

    def self.step_ahead(position)
      stepped = position.clone
      case stepped.direction
      when :north then stepped.y += 1
      when :south then stepped.y -= 1
      when :east  then stepped.x += 1
      when :west  then stepped.x -= 1
      end
      stepped
    end

    def initialize(opts)
      @x, @y = opts[:x], opts[:y]
      @direction = opts[:direction]
    end

    def to_s
      "#{x},#{y},#{direction.upcase}\n"
    end

    def rotate(kind)
      idx = DIRECTIONS.index(direction).send(kind, 1) % DIRECTIONS.length
      self.direction = DIRECTIONS[idx]
    end
  end
end
