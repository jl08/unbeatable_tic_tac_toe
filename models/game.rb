require_relative '../views/game_view'

class Game
  attr_accessor :player1, :player2, :board

  def initialize(player1 = nil, player2 = nil, board = nil)
    @player1 = player1
    @player2 = player2
    @board   = board
    @view = GameView.new()
  end

  def get_winner
    if @board.is_winner?(@player1.marker)
      return @player1
    elsif @board.is_winner?(@player2.marker)
      return @player2
    else
      return nil
    end
  end

  def has_winner?
    if @board.is_winner?(@player1.marker) || @board.is_winner?(@player2.marker)
      return true
    end
    false
  end

  def over?
    @board.is_full? || has_winner?
  end

  def run
    player1_move = @player1.make_move(@board, @player1.marker, @player2.marker)
    @board.update(player1_move, @player1.marker)
    @view.display_board(@board)
    if !over?
      player2_move = @player2.make_move(@board,@player2.marker, @player1.marker)
      @board.update(player2_move, @player2.marker)
      @view.display_board(@board)
    end
  end

  def start
    @view.display_options
  end

  def get_selected_game
    @view.get_game_option
  end
end
