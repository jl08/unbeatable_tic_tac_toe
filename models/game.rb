class Game
  def initialize(player1, player2, board)
    @player1 = player1
    @player2 = player2
    @board   = board
  end

  def display_board
    @board.display
  end

  def over?
    @board.is_full? || @board.has_winner?
  end

  def run
    player1_move = @player1.make_move(@board, "X", "O")
    @board.update(player1_move, "X")

    if !over?
      player2_move = @player2.make_move(@board,"O", "X")
      puts "player 2 move"
      puts player2_move
      @board.update(player2_move, "O")

    end
    puts @board.formatted_display
  end

end
