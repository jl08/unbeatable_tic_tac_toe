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
      move = AI.make_move(board, marker, opposing_marker)
    else
      move = @view.get_move(board.remaining_options)
      # if !board.valid_placement?(move)
      #   until board.valid_placement?(move)
      #     puts "Not a valid spot! Try again."
      #     move = @view.get_move
      #   end
      # end
    end
    move
  end
end
