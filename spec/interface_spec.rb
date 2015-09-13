require_relative 'spec_helper'

describe ToyRobot::Interface do

  subject { ToyRobot::Interface }

  let(:robot) { Minitest::Mock.new }

  describe "on attempt to place robot" do

    let(:coords) { { :x => 0, :y => 0, :direction => :north } }
    let(:command) { {name: :place, args: coords} }

    it "calls robot instance place method with proper args" do
      robot.expect :place, nil, [coords]
      subject.run(robot, command)
      robot.verify
    end
  end

  describe "on attempt to rotate robot" do

    let(:arg) { :+ }
    let(:command) { {name: :rotate, args: arg} }

    it "calls robot instance rotate method with proper args" do
      robot.expect :rotate, nil, [arg]
      subject.run(robot, command)
      robot.verify
    end
  end

  describe "on attempt to move robot" do

    let(:command) { {name: :move} }

    it "calls robot instance move method with no args" do
      robot.expect :move, nil
      subject.run(robot, command)
      robot.verify
    end
  end

  describe "on attempt to report robot location" do

    let(:command) { {name: :report} }

    it "calls robot instance report method with no args" do
      robot.expect :report, nil
      subject.run(robot, command)
    end
  end
end
