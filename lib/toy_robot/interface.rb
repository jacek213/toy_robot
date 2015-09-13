module ToyRobot
  class Interface

    def self.run(robot, command)
      case command[:name]
      when :place   then robot.place(command[:args])
      when :rotate  then robot.rotate(command[:args])
      when :move    then robot.move
      when :report  then STDERR.puts("#{robot.report}\n") if robot.report
      end
    end
  end
end
