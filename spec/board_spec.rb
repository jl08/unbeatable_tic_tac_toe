require_relative '../models/game'
require_relative '../models/player'
require_relative '../models/board'

RSpec.describe Board do
  let(:x_marker) { "X" }
  let(:o_marker) { "O" }
  let(:three_in_a_row_board) { [nil,nil,nil,nil,o_marker,o_marker,x_marker,x_marker,x_marker] }
  let(:three_vertical_board) { [nil,nil,x_marker,o_marker,o_marker,x_marker,x_marker,o_marker,x_marker] }
  let(:three_diagonal_board){ [x_marker,nil,nil,o_marker,x_marker,o_marker,x_marker,o_marker,x_marker] }
  let(:three_other_diagonal_board) { [nil,nil,x_marker,o_marker,x_marker,o_marker,x_marker,o_marker,x_marker] }
  let(:no_winners_board) { [o_marker,x_marker,o_marker,x_marker,x_marker,o_marker,x_marker,o_marker,x_marker] }
  let(:incomplete_board) { [nil,nil,nil,nil,x_marker,o_marker,x_marker,o_marker,x_marker] }
  let(:default_board) { Board.new() }
  let(:tie_board) { Board.new(no_winners_board) }

  describe "#initialize" do
    context "when board is provided" do
      it "sets the grid as provided board" do
        expect(tie_board.grid).to eq no_winners_board
      end
      it "does not set the grid as default board" do
        expect(tie_board.grid).not_to eq default_board.grid
      end
    end

    context "when board is not provided" do
      it "generates a default grid with nil values" do
        expect(default_board.grid.all? {|value| value.nil? }).to eq true
      end
    end
  end

  describe "#is_full?" do
    context "when board is full" do
      it "returns true" do
        expect(tie_board.is_full?).to eq true
      end
    end
    context "when board is empty" do
      it "returns false" do
        expect(default_board.is_full?).to eq false
      end
    end
    context "when board is incomplete" do
      it "returns false" do
        unfinished_board = Board.new(incomplete_board)
        expect(unfinished_board.is_full?).to eq false
      end
    end
  end

  let(:x_row_win) { Board.new(three_in_a_row_board)}
  let(:x_vertical_win) { Board.new(three_vertical_board)}
  let(:x_diagonal_win) { Board.new(three_diagonal_board)}
  let(:x_other_diagonal_win) { Board.new(three_other_diagonal_board)}

  describe "#has_row_match?" do
    context "when three in a row" do
      it "returns true" do
        expect(x_row_win.has_row_match?(x_marker)).to eq true
      end
    end
  end

  describe "#has_vertical_match?" do
    context "when three X in a row" do
      it "returns false" do
        expect(x_row_win.has_vertical_match?(x_marker)).to eq false
      end
    end

    context "when three X vertical" do
      it "returns true" do
        expect(x_vertical_win.has_vertical_match?(x_marker)).to eq true
      end
    end
  end

  describe "#has_diagonal_match?" do
    context "when three X in a row" do
      it "returns false" do
        expect(x_row_win.has_diagonal_match?(x_marker)).to eq false
      end
    end

    context "when three X diagonal" do
      it "returns true" do
        expect(x_diagonal_win.has_diagonal_match?(x_marker)).to eq true
      end
    end
  end

  describe "#has_other_diagonal_match?" do
    context "when three X in a row" do
      it "returns false" do
        expect(x_row_win.has_other_diagonal_match?(x_marker)).to eq false
      end
    end

    context "when three X other diagonal" do
      it "returns true" do
        expect(x_other_diagonal_win.has_other_diagonal_match?(x_marker)).to eq true
      end
    end
  end


  describe "#has_winner?" do
    context "when there are three in a row" do
      it "returns true" do
        p x_row_win.grid
        p x_row_win.is_winner?(x_marker)
        expect(x_row_win.has_winner?).to eq true
      end
    end
  end

  describe "#is_winner?" do
    context "when three X in a row" do
      it "X returns true" do
        expect(x_row_win.is_winner?(x_marker)).to eq true
      end
      it "O returns false" do
        expect(x_row_win.is_winner?(o_marker)).to eq false
      end
    end
    context "when board has no winner" do
      it "X returns false" do
        expect(tie_board.is_winner?(x_marker)).to eq false
      end
      it "O returns false" do
        expect(tie_board.is_winner?(o_marker)).to eq false
      end

    end
  end

end
