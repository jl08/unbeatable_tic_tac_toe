require_relative '../models/game'
require_relative '../models/player'
require_relative '../models/board'
RSpec.describe Game do

  let(:player1) { Player.new("human") }
  let(:player2) { Player.new("human") }
  let(:board) { Board.new() }

  # describe "#initialize" do
  #
  #   it "" do
  #
  #     game = Game.new(player1, player2, board)
  #
  #   end
  # end
  #
  # describe "#display_board" do
  #   it "displays the current board" do
  #     # 20.times { game.roll(0) }
  #     # expect(game.score).to eq(0)
  #   end
  # end
  #
  # describe "#over?" do
  #   it "returns true when board is full" do
  #
  #   end
  #
  #   it "returns true when a player has won" do
  #   end
  #
  # end
end
