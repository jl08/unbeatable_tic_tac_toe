require_relative '../../models/board'
require_relative '../../models/ai'

RSpec.describe AI do

  let(:x_marker) { "X" }
  let(:o_marker) { "O" }

  let(:no_winners_board) { [o_marker,x_marker,o_marker,x_marker,x_marker,o_marker,x_marker,o_marker,x_marker] }
  let(:incomplete_board) { [nil,nil,nil,nil,x_marker,o_marker,x_marker,o_marker,x_marker] }

  let(:tie_board) { Board.new(no_winners_board) }
  let(:pre_loaded_board) { Board.new(incomplete_board) }

  describe ".make_move" do
    context "when board is full" do
      it "returns nil" do
        expect(AI.make_move(tie_board.grid, tie_board.remaining_options, :x_marker, :o_marker)).to eq nil
      end
    end
    context "when board is not full" do
      it "returns a move" do
        expect(AI.make_move(pre_loaded_board.grid, pre_loaded_board.remaining_options, :x_marker, :o_marker)).to_not eq nil
      end
      it "returns the smartest move" do
        expect(AI.make_move(pre_loaded_board.grid, pre_loaded_board.remaining_options, :x_marker, :o_marker)).to eq 2
      end
    end
  end

  let(:corners_occupied) { [x_marker,nil,o_marker,nil,nil,nil,x_marker,nil,o_marker] }
  let(:one_corner_occupied) { [nil,nil,nil,nil,nil,nil,nil,nil,x_marker] }

  describe "#get_corner_options" do
    context "when all corners occupied" do
      it "should return empty array" do

      end
    end
    context "when only 1 corner is occupied" do
      it "should return the other three corners" do

      end
    end
  end

  describe "get_block_options"  do
    context "" do
      it "" do

      end
    end

  end

  describe ".winning_move?" do
    context "when three in a row" do
      it "returns true" do
        expect(AI.make_move(tie_board.grid, tie_board.remaining_options, :x_marker, :o_marker)).to eq nil
      end
    end
    context "when board is not full" do
      it "returns a move" do
        expect(AI.make_move(pre_loaded_board.grid, pre_loaded_board.remaining_options, :x_marker, :o_marker)).to_not eq nil
      end
      it "returns the smartest move" do
        expect(AI.make_move(pre_loaded_board.grid, pre_loaded_board.remaining_options, :x_marker, :o_marker)).to eq 2
      end
    end
  end

end
