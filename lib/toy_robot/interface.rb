module ToyRobot
  class Interface

    def self.run(robot, command)
      case command[:name]
      when 'PLACE'  then robot.place(command[:args])
      when 'MOVE'   then robot.move
      when 'LEFT'   then robot.rotate(:left)
      when 'RIGHT'  then robot.rotate(:right)
      when 'REPORT' then robot.report
      end
    end
  end
end
