require 'singleton'

class AI
include Singleton
  def self.make_move(board, marker, opposing_marker)
    if board.is_full?
      return nil
    end
    if board.grid.all? {|x| x.nil?}
      return rand(6...8)
    end
    final_move = board.remaining_options[0]
    if board.remaining_options.length == 1
      return final_move
    end

    # check if ai can win in one move
    next_move_win_position = find_next_move(board, board.remaining_options, marker, opposing_marker)
    puts next_move_win_position
    if !next_move_win_position.nil?
      return next_move_win_position
    end

    # # block possible win next turn
    opposition_win_position = find_next_move(board, board.remaining_options, opposing_marker, marker)
    if !opposition_win_position.nil?
      # should probably add second layer of checking to this
      return opposition_win_position
    end

    next_move = find_next_move(board, board.remaining_options, marker, opposing_marker)
    if next_move.nil?
      until !next_move.nil? do
        remaining_options = Array.new(board.remaining_options)
        remaining_options = remaining_options - [next_move]
        opposing_team_next_move = find_next_move(board, remaining_options, opposing_marker, marker)
      end
    end
    next_move
  end


  def self.find_next_move(board,remaining_options, marker, opposing_marker)
    if remaining_options.length < 1
      return nil
    end
    next_move = nil
    grid_copy = board.grid.map do |tile|
      tile
    end

    bad_options = []

    remaining_options.each do |option|

      old_val = grid_copy[option]
      grid_copy[option] = marker
      temp_board = Board.new(grid_copy)
      if temp_board.is_winner?(marker) == true
        next_move = option
        break
      else

        opposing_team_next_move = find_next_move(temp_board, temp_board.remaining_options, opposing_marker, marker)
        if !opposing_team_next_move.nil?
          temp_board_grid_copy = temp_board.grid.map do |tile|
            tile
          end
          temp_board_grid_copy[opposing_team_next_move] = opposing_marker
          new_board = Board.new(temp_board_grid_copy)
          if new_board.is_winner?(opposing_marker)
            bad_options << option
          end
        end
      end
      grid_copy[option] = old_val
    end
    remaining_options = remaining_options - bad_options
    next_move = remaining_options.sample
    next_move
  end
end
