module ToyRobot
  class CommandParser
    class << self

      PLACE_COMMAND_REGEX = /\A(PLACE) (\d*,\d*,(EAST|WEST|NORTH|SOUTH))\z/
      ROTATION_COMMAND_REGEX = /\A(LEFT|RIGHT)\z/
      OTHER_COMMAND_REGEX = /\A(MOVE|REPORT)\z/

      def fetch(input)
        if input.match(ROTATION_COMMAND_REGEX)
          { name: :rotate, args: rotation_args(input) }
        elsif input.match(OTHER_COMMAND_REGEX)
          { name: input.downcase.to_sym }
        else
          match = input.match(PLACE_COMMAND_REGEX)
          if match
            command, args = match.captures
            { name: :place, args: position_args(args) }
          end
        end
      end

      private

      def rotation_args(input)
        case input
        when 'LEFT'  then :-
        when 'RIGHT' then :+
        end
      end

      def position_args(params)
        args = params.split(',')
        {
          x: args[0].to_i,
          y: args[1].to_i,
          direction: args[2].downcase.to_sym
        }
      end
    end
  end
end
