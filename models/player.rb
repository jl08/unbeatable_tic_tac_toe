require_relative './ai'
class Player

  def initialize(player_type)
    @type = player_type
  end

  def make_move(board, marker, opposing_marker)
    if @type == "human"
      puts board.formatted_display
      move = gets.chomp.to_i
      if !board.remaining_options.include?(move)
        puts "Not a valid spot! Try again."
        make_move(board, marker)
      end
    else
      # this is for ai
      tttai = AI.instance
      move = AI.make_move(board, marker, opposing_marker)
    end
    move
  end
end
