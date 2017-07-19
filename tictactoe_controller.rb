require_relative './models/player'
require_relative './models/game'
require_relative './models/board'

class TicTacToeController

  def start
    # display user options

    options = {
      1 => "1) Player 1: human vs Player 2: human",
      2 => "2) Player 1: human vs Player 2: ai ",
      3 => "3) Player 1: ai vs Player 2: human"
    }

    options.each do |option, text|
      puts text
    end
    # should get user choice from commandline or some other source
    user_choice = gets.chomp.to_i

    board = Board.new()

    if user_choice == 1
      player1 = Player.new("human")
      player2 = Player.new("human")
      game    = Game.new(player1, player2, board)
    elsif user_choice == 2
      player1 = Player.new("human")
      player2 = Player.new("ai")
      game    = Game.new(player1, player2, board)
    else
      player1 = Player.new("ai")
      player2 = Player.new("human")
      game    = Game.new(player1, player2, board)
    end
    until game.over?
      game.run
    end
    if board.has_winner?
      puts "board has winner!"
    end

  end

end

tictactoe_controller = TicTacToeController.new()
tictactoe_controller.start
