require_relative 'spec_helper'

describe ToyRobot::CommandParser do

  subject { ToyRobot::CommandParser }

  describe "when valid input passed" do

    describe "for a PLACE command" do

      let(:input) { "PLACE 1,2,WEST" }
      let(:expectation) {
        {name: :place, args: {x: 1, y: 2, direction: :west}}
      }

      it "returns hash with method name and arguments" do
        subject.fetch(input).must_equal expectation
      end
    end

    describe "for a LEFT command" do

      let(:input) { "LEFT" }
      let(:expectation) {
        {name: :rotate, args: :-}
      }

      it "returns hash with method name and negative rotation as argument" do
        subject.fetch(input).must_equal expectation
      end
    end

    describe "for a RIGHT command" do

      let(:input) { "RIGHT" }
      let(:expectation) {
        {name: :rotate, args: :+}
      }

      it "returns hash with method name and positive rotation as argument" do
        subject.fetch(input).must_equal expectation
      end
    end

    describe "for MOVE command" do

      let(:input) { "MOVE" }
      let(:expectation) {
        {name: :move}
      }

      it "returns hash with method name and no arguments" do
        subject.fetch(input).must_equal expectation
      end
    end

    describe "for REPORT command" do

      let(:input) { "REPORT" }
      let(:expectation) {
        {name: :report}
      }

      it "returns hash with method name and no arguments" do
        subject.fetch(input).must_equal expectation
      end
    end
  end

  describe "when input is invalid" do

    describe "for a place command" do

      let(:input) { "PLACE 1,2,FOOBAR" }

      it "returns nil" do
        subject.fetch(input).must_be_nil
      end
    end

    describe "containing some random command" do

      let(:input) { "FOO BAZ, BAR" }

      it "returns nil" do
        subject.fetch(input).must_be_nil
      end
    end
  end
end
