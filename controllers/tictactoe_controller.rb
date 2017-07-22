require_relative '../models/player'
require_relative '../models/game'
require_relative '../models/board'

class TicTacToeController

  def start
    game  = Game.new()
    game.start
    player1_marker = "X"
    player2_marker = "O"
    human_player = "human"

    user_choice = game.get_selected_game
    if user_choice == 1
      game.player1 = Player.new(player1_marker, human_player)
      game.player2 = Player.new(player2_marker, human_player)
    elsif user_choice == 2
      game.player1 = Player.new(player1_marker, human_player)
      game.player2 = Player.new(player2_marker)
    else
      game.player1 = Player.new(player1_marker)
      game.player2 = Player.new(player2_marker, human_player)
    end

    game.board = Board.new()
    game.show_instructions
    until game.over?
      game.run
    end
    game.end
  end

end

tictactoe_controller = TicTacToeController.new()
tictactoe_controller.start
