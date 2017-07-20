require_relative '../models/player'
require_relative '../models/game'
require_relative '../models/board'

class TicTacToeController

  def start
    game  = Game.new()
    game.start
    user_choice = game.get_selected_game

    player1_marker = "X"
    player2_marker = "O"

    human_player = "human"

    if user_choice == 1
      player1 = Player.new(player1_marker, human_player)
      player2 = Player.new(player2_marker, human_player)
    elsif user_choice == 2
      player1 = Player.new(player1_marker, human_player)
      player2 = Player.new(player2_marker)
    else
      player1 = Player.new(player1_marker)
      player2 = Player.new(player2_marker, human_player)
    end

    board = Board.new()
    game.player1 = player1
    game.player2 = player2
    game.board = board
    until game.over?
      game.run
    end
    if game.has_winner?
      puts "board has winner!"
    else
      puts "No one wins. :["
    end

  end

end

tictactoe_controller = TicTacToeController.new()
tictactoe_controller.start
#
