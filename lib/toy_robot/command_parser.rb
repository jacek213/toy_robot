module ToyRobot
  class CommandParser
    attr_reader :input

    GENERAL_COMMAND_REGEX = /\A(MOVE|LEFT|RIGHT|REPORT)\z/
    PLACE_COMMAND_REGEX = /\A(PLACE) (\d*,\d*,(EAST|WEST|NORTH|SOUTH))\z/

    def self.fetch(input)
      if input.match(GENERAL_COMMAND_REGEX)
        {name: input}
      else
        match = input.match(PLACE_COMMAND_REGEX)
        if match
          command, args = match.captures
          {name: command, args: position_args(args)}
        end
      end
    end

    private

    def self.position_args(params)
      args = params.split(',')
      {
        x: args[0].to_i,
        y: args[1].to_i,
        orientation: args[2].downcase.to_sym
      }
    end
  end
end
