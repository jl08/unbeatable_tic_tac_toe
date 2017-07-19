require 'singleton'

class AI
include Singleton
  def self.make_move(board, marker, opposing_marker)
    if board.is_full?
      return nil
    end
    final_move = board.remaining_options[0]
    if board.remaining_options.length == 1
      return final_move
    end

    # check if ai can win in one move
    next_move_win_position = find_next_move(board.grid, board.remaining_options, marker)
    puts next_move_win_position
    if !next_move_win_position.nil?
      return next_move_win_position
    end

    # # block possible win next turn
    # opposition_win_position = find_next_move(board.grid, board.remaining_options, opposing_marker)
    # if !opposition_win_position.nil?
    #   # should probably add second layer of checking to this
    #   return opposition_win_position
    # end
    #
    # # getting smarter
    # # pre-place ai chip. see if opposing team wins. if yes, remove from list
    # remaining_options = Array.new(board.remaining_options)
    #
    #
    # until remaining_options.length == 1
    #   # predict that next move will be winner (for opposing team)
    #   bad_options = []
    #   remaining_options.each do |option|
    #     temporary_board = Board.new(board.grid)
    #     temporary_board.update(option, marker)
    #
    #     opposing_team_next_move = find_next_move(temporary_board.grid, temporary_board.remaining_options, opposing_marker)
    #     if !opposing_team_next_move.nil?
    #       bad_options << option
    #     end
    #   end
    #   remaining_options = remaining_options - bad_options
    # end
    # remaining_options[0]
  end

  def self.find_next_move(board_grid,remaining_options, marker)
    next_move = nil
    remaining_options.each do |option|
      temporary_board = Board.new(board_grid)
      temporary_board.update(option, marker)
      if temporary_board.is_winner?(marker)
        next_move = option
        break
      end
    end
    next_move
  end
end
