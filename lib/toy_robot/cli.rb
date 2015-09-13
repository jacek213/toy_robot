module ToyRobot
  class CLI
    class << self
      def start
        trap_interrupt
        print_line

        ARGF.each_line do |line|
        trap("INT") { puts '1' }
          @table ||= Table.new(5, 5)
          @robot ||= Robot.new(@table)
          command = CommandParser.fetch(line.strip)
          Interface.run(@robot, command) if command
          print_line
        trap("INT") { puts '2' }
        end
      end

      private

      def print_line
        print 'robot >> '
      end

      def trap_interrupt
        trap("INT") { puts "\nExiting ..."; exit }
      end
    end
  end
end
