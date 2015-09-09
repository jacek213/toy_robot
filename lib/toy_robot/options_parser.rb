module ToyRobot
  class OptionsParser
    attr_reader :input

    VALID_COMMAND_REGEX = /\A(MOVE|LEFT|RIGHT|REPORT)\z/
    VALID_PLACE_REGEX = /\A(PLACE) (\d*,\d*,(EAST|WEST|NORTH|SOUTH))\z/

    def self.fetch_command(input)
      if input.match(VALID_COMMAND_REGEX)
        {command: input}
      else
        match = input.match(VALID_PLACE_REGEX)
        if match
          command, args = match.captures
          {command: command, args: position_args(args)}
        end
      end
    end

    private

    def self.position_args(params)
      args = params.split(',')
      {x: args[0].to_i, y: args[1].to_i, orientation: args[2].downcase.to_sym}
    end
  end
end
