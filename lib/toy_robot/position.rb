module ToyRobot
  class Position
    attr_reader :x, :y
    attr_accessor :orientation

    def initialize(opts)
      @x = opts[:x]
      @y = opts[:y]
      @orientation = opts[:orientation]
    end
  end
end
