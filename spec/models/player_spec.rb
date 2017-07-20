require_relative '../../models/game'
require_relative '../../models/player'
require_relative '../../models/board'

RSpec.describe Player do

  let(:x_marker) { "X" }
  let(:o_marker) { "O" }

  let(:new_board) { Board.new() }

  let(:three_in_a_row_board) { [nil,nil,nil,nil,o_marker,o_marker,x_marker,x_marker,x_marker] }
  let(:x_row_win) { Board.new(three_in_a_row_board)}

  let(:no_winners_board) { [o_marker,x_marker,o_marker,x_marker,x_marker,o_marker,x_marker,o_marker,x_marker] }
  let(:tie_board) { Board.new(no_winners_board) }



  let(:player1) { Player.new(x_marker) }
  let(:player2) { Player.new(o_marker) }


  describe "#make_move" do
    context "when board is empty" do
      it "returns a move" do
        move = player1.make_move(new_board, player1.marker, player2.marker)
        expect(move).to_not eq nil
      end
    end
    context "when board is full" do
      it "returns nil" do
        move = player1.make_move(tie_board, player1.marker, player2.marker)
        expect(move).to eq nil
      end
    end
  end

end
