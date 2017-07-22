require_relative '../views/player_view'
require_relative './ai'

class Player
attr_reader :marker

  def initialize(marker, player_type = nil)
    @marker = marker
    @type = player_type || "ai"
    @view = PlayerView.new()
  end

  def make_move(board, marker, opposing_marker)
    if @type == "ai"
      move = AI.make_move(board.grid, board.remaining_options, marker, opposing_marker)
    else
      move = @view.get_move(board.remaining_options, marker)
    end
    move
  end
end
