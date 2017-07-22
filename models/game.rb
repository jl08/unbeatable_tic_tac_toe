require_relative '../views/game_view'

class Game
  attr_accessor :player1, :player2, :board

  def initialize(player1 = nil, player2 = nil, board = nil)
    @player1 = player1
    @player2 = player2
    @board   = board
    @view = GameView.new()
  end

  def end
    @view.display_winner(get_winner)
  end

  def get_winner
    if board.is_winner?(player1.marker)
      return player1
    elsif board.is_winner?(player2.marker)
      return player2
    end
  end

  def has_winner?
    if board.is_winner?(player1.marker) || board.is_winner?(player2.marker)
      return true
    end
    false
  end

  def over?
    board.is_full? || has_winner?
  end

  def play_round(player, opposing_marker)
    player_move = player.make_move(board, player.marker, opposing_marker)
    board.update(player_move, player.marker)
    @view.display_board(board)
  end

  def run
    @view.display_board(board)
    play_round(player1, player2.marker)
    if !over?
      play_round(player2, player1.marker)
    end
  end

  def show_instructions
    @view.display_instructions
  end

  def start
    @view.display_options
  end

  def get_selected_game
    @view.get_game_option
  end
end
