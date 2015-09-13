require_relative 'spec_helper'

describe ToyRobot::Position do

  subject { ToyRobot::Position }

  let(:position) { subject.new(x: 2, y: 3, direction: :west) }

  it "returns it's attributes" do
    position.must_respond_to :x
    position.must_respond_to :y
    position.must_respond_to :direction

    position.x.must_equal 2
    position.y.must_equal 3
    position.direction.must_equal :west
  end

  it "returns it's attributes as string" do
    position.must_respond_to :to_s
    position.to_s.must_equal "2,3,WEST"
  end

  describe "on rotation call" do

    it "rotates properly to the left" do
      position.rotate(:-)
      position.direction.must_equal :south
      position.rotate(:-)
      position.direction.must_equal :east
      position.rotate(:-)
      position.direction.must_equal :north
      position.rotate(:-)
      position.direction.must_equal :west
    end

    it "rotates properly to the right" do
      position.rotate(:+)
      position.direction.must_equal :north
      position.rotate(:+)
      position.direction.must_equal :east
      position.rotate(:+)
      position.direction.must_equal :south
      position.rotate(:+)
      position.direction.must_equal :west

    end
  end

  describe "on step ahead" do

    let(:after_step) { subject.step_ahead(position) }

    it "returns new instance with proper attributes on step ahead" do
      after_step.wont_be_same_as position
      after_step.direction.must_equal :west
      after_step.x.must_equal 1
      after_step.y.must_equal 3
      after_step.to_s.must_equal "1,3,WEST"
    end

    it "doesn't modify the initial position" do
      position.x.must_equal 2
      position.y.must_equal 3
      position.direction.must_equal :west
    end
  end
end
