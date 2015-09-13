require_relative 'spec_helper'

describe ToyRobot::Robot do

  let(:table) { ToyRobot::Table.new(5, 5) }

  subject { ToyRobot::Robot.new(table) }

  let(:init_coords) { {x: 0, y: 0, direction: :north} }
  let(:placed_robot) {
    robot = subject.clone
    robot.place(init_coords)
    robot
  }

  it "is initialized with table and no position" do
    subject.table.must_equal table
    subject.position.must_be_nil
  end

  it "should not be placed if there in no position" do
    subject.send(:placed?).must_equal false
  end

  describe "when attempting to place" do

    let(:valid_coords) { {x: 2, y: 4, direction: :north} }

    it "should succeed if coordinates in range of table" do
      subject.place(valid_coords)
      subject.send(:placed?).must_equal true
      subject.position.must_be_instance_of ToyRobot::Position
    end

    let(:invalid_coords) { {x: 5, y: 5, direction: :north} }

    it "shouldn't succeed if coordinates out of table's range" do
      subject.place(invalid_coords)
      subject.send(:placed?).must_equal false
      subject.position.must_be_nil
    end

    it "should be placed again on valid request" do
      subject.place(valid_coords)
      subject.send(:placed?).must_equal true
      subject.place({x: 0, y: 2, direction: :west})
      subject.position.x.must_equal 0
      subject.position.y.must_equal 2
      subject.position.direction.must_equal :west
    end
  end

  describe "on attempt to rotate" do

    it "ignores command if not placed" do
      subject.rotate(:+)
      subject.position.must_be_nil
    end

    it "turns right if argument is plus symbol" do
      placed_robot.rotate(:+)
      placed_robot.position.direction.must_equal :east

    end

    it "turns left if argument is minus symbol" do
      placed_robot.rotate(:-)
      placed_robot.position.direction.must_equal :west
    end
  end


  describe "on attempt to move" do

    it "ignores command if not placed" do
      subject.move
      subject.position.must_be_nil
    end

    it "moves one step forward in y-axis if it doesn't exceed table's range" do
      placed_robot.move
      placed_robot.position.x.must_equal 0
      placed_robot.position.y.must_equal 1
    end

    it "ignores command if table end reached" do
      10.times { placed_robot.move }
      placed_robot.position.x.must_equal 0
      placed_robot.position.y.must_equal 4
    end

    it "moves one step forward in x-axis unless table's range exceeded" do
      placed_robot.place({x: 0, y: 2, direction: :east})
      10.times { placed_robot.move }
      placed_robot.position.x.must_equal 4
      placed_robot.position.y.must_equal 2
    end
  end

  describe "on attempt to report" do

    it "yields nothing if not placed" do
      subject.report.must_be_nil
    end

    it "calls position to_s if placed" do
      placed_robot.report.must_equal "0,0,NORTH"
    end
  end
end
