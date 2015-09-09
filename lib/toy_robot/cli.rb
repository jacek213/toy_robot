module ToyRobot
  class CLI

    def self.start
      ARGF.each_line do |line|
        @table ||= Table.new(5, 5)
        @robot ||= Robot.new(@table)
        command = CommandParser.fetch(line.strip)
        Interface.run(@robot, command) if command
      end
    end
  end
end
