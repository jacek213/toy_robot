module ToyRobot
  class CLI

    def self.start
      ARGF.each_line do |line|
        @robot ||= Robot.new(Table.new(5,5))
        command = OptionsParser.fetch_command(line.strip)
        Interface.run(@robot, command) if command
      end
    end
  end
end
