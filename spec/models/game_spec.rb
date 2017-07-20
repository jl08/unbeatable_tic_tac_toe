require_relative '../../models/game'
require_relative '../../models/player'
require_relative '../../models/board'

RSpec.describe Game do

  let(:x_marker) { "X" }
  let(:o_marker) { "O" }

  let(:player1) { Player.new(x_marker, "human") }
  let(:player2) { Player.new(o_marker, "human") }


  let(:board) { Board.new() }
  let(:new_game) { Game.new(player1, player2, board)}

  let(:three_in_a_row_board) { [nil,nil,nil,nil,o_marker,o_marker,x_marker,x_marker,x_marker] }
  let(:x_row_win) { Board.new(three_in_a_row_board)}
  let(:x_win_game) { Game.new(player1, player2, x_row_win)}

  let(:no_winners_board) { [o_marker,x_marker,o_marker,x_marker,x_marker,o_marker,x_marker,o_marker,x_marker] }
  let(:tie_board) { Board.new(no_winners_board) }
  let(:tie_game) { Game.new(player1, player2, tie_board)}


  describe "#get_winner" do
    context "when x has three in a row" do
      it "returns player x" do
        expect(x_win_game.get_winner).to eq player1
      end
      it "does not return player O" do
        expect(x_win_game.get_winner).to_not eq player2
      end
    end
    context "when board is empty" do
      it "returns nil" do
        expect(new_game.get_winner).to eq nil
      end
    end
  end

  describe "#has_winner?" do
    context "when there are three in a row" do
      it "returns true" do
        expect(x_win_game.has_winner?).to eq true
      end
    end
    context "when board is empty" do
      it "returns false" do
        expect(new_game.has_winner?).to eq false
      end
    end
  end

  describe "#over?" do
    context "when board is full" do
      it "returns true" do
        expect(tie_game.over?).to eq true
      end
    end
    context "when there are three in a row" do
      it "returns true" do
        expect(x_win_game.over?).to eq true
      end
    end
    context "when board is empty" do
      it "returns false" do
        expect(new_game.over?).to eq false
      end
    end
  end

  # describe "#run" do
  # end
end
