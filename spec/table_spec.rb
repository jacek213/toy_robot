require_relative 'spec_helper'

describe ToyRobot::Position do

  subject { ToyRobot::Table }

  let(:table) { subject.new(4, 8) }

  it "returns it's attributes" do
    table.width.must_equal 4
    table.height.must_equal 8
  end

  describe "when validating position" do

    it "returns true if x and y in its dimensions" do
      table.valid_position?(0, 0).must_equal true
      table.valid_position?(3, 3).must_equal true
      table.valid_position?(3, 7).must_equal true
    end


    it "returns false if x or y out of range" do
      table.valid_position?(-1, 0).must_equal false
      table.valid_position?(4, 8).must_equal false
      table.valid_position?(0, 8).must_equal false
    end
  end
end
