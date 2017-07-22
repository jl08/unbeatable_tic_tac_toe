require_relative '../../models/board'
require_relative '../../models/ai'

RSpec.describe AI do

  let(:x_marker) { "X" }
  let(:o_marker) { "O" }

  let(:no_winners_board) { [o_marker,x_marker,o_marker,x_marker,x_marker,o_marker,x_marker,o_marker,x_marker] }
  let(:incomplete_board) { [nil,nil,nil,nil,x_marker,o_marker,x_marker,o_marker,x_marker] }
  let(:two_corners_occupied) { [nil,nil,nil,nil,nil,nil,o_marker,nil,x_marker] }
  let(:corners_occupied) { [x_marker,nil,x_marker,nil,nil,nil,o_marker,nil,o_marker] }

  let(:default_board) { Board.new() }
  let(:tie_board) { Board.new(no_winners_board) }
  let(:pre_loaded_board) { Board.new(incomplete_board) }
  let(:corners_occupied_board) { Board.new(corners_occupied) }
  let(:two_corners_occupied_board) { Board.new(two_corners_occupied) }

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
  
  describe ".get_blocking_options"  do
    context "when board is empty" do
      it "returns an empty array" do
        expect(AI.get_blocking_options(default_board.grid, o_marker)).to eq []
      end
    end
    context "when opponent marker has only one chip on the board" do
      it "returns an array of the numbers surrounding the opponent marker" do
        expect(AI.get_blocking_options(two_corners_occupied_board.grid, o_marker).sort).to eq [3,4,7]
      end
    end
  end

  describe ".get_corner_options" do
    context "when all corners occupied" do
      it "should return empty array" do
        expect(AI.get_corner_options(corners_occupied_board.grid)).to eq []
      end
    end
    context "when 2 corners are occupied" do
      it "should return the other 2 corners" do
        expect(AI.get_corner_options(two_corners_occupied_board.grid)).to eq [0,2]
      end
    end
  end

  describe ".get_next_move" do
    context "when two consecutive markers" do
      it "returns the third (winning) tile" do
        grid = corners_occupied_board.grid
        options = corners_occupied_board.remaining_options
        expect(AI.get_next_move(grid, options, x_marker)).to eq 1
      end
    end
    context "when board is empty" do
      it "returns nil" do
        grid = default_board.grid
        options = default_board.remaining_options
        expect(AI.get_next_move(grid, options, x_marker)). to eq nil
      end
    end
    context "when next move only gives two in a row" do
      it "returns nil" do
        grid = two_corners_occupied_board.grid
        options = two_corners_occupied_board.remaining_options
        expect(AI.get_next_move(grid, options, x_marker)). to eq nil
      end
    end
  end

  describe ".sort_options_by_frequency"  do
    context "given [1,2,3,1,1,3,7]" do
      it "returns [1,3,2,7]" do
        expect(AI.sort_options_by_frequency([1,2,3,1,1,3,7])).to eq [1,3,2,7]
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
