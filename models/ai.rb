require 'singleton'

class AI
include Singleton

  def self.make_move(grid, remaining_options, marker, opposing_marker)

    # board is already complete
    if grid.all? {|x| !x.nil?}
      return nil
    end

    # only one choice left
    if remaining_options.length == 1
      return remaining_options[0]
    end

    # board is empty -- choose a corner move
    if grid.all? {|x| x.nil?}
      return [0,2,6,8].sample
    end

    # check if win on next move is possible
    next_move_win = self.get_next_move(grid, remaining_options, marker)
    if !next_move_win.nil?
      return next_move_win
    end

    # check and block if opponent's best move is a win
    opponent_next_move_win = self.get_next_move(grid, remaining_options, opposing_marker)
    if !opponent_next_move_win.nil?
      return opponent_next_move_win
    end

    # check available corners
    corner_options = self.get_corner_options(grid)
    if corner_options.length == 1
      return corner_options[0]
    end

    # check if anything needs to be blocked
    blocking_options = self.get_blocking_options(grid, opposing_marker)
    if blocking_options.length == 1
      return blocking_options[0]
    end

    # sort all remaining options by frequency
    best_possible_options = blocking_options + corner_options
    sorted_options_by_frequency = sort_options_by_frequency(best_possible_options)
    return sorted_options_by_frequency[0]
  end

  def self.get_blocking_options(grid, opposing_marker)
    blocking_options = []
    if grid.include?(opposing_marker) && grid[4].nil?
      blocking_options << 4
    end
    grid.each_with_index do |tile, index|
      if tile == opposing_marker

        # top 2 rows
        if index < 6
          tile_right_below = grid[index + 3]
          if tile_right_below.nil?
            blocking_options << index + 3
          end
        end

        # bottom 2 rows
        if index > 2
          tile_right_above = grid[index - 3]
          if tile_right_above.nil?
            blocking_options << index - 3
          end
        end

        # first two columns
        if (index + 1) % 3  != 0
          tile_to_the_right = grid[index + 1]
          if tile_to_the_right.nil?
            blocking_options << index + 1
          end
        end

        # second two columns
        if (index + 1) % 3 != 1
          tile_to_the_left = grid[index - 1]
          if tile_to_the_left.nil?
            blocking_options << index - 1
          end
        end
      end
    end
    blocking_options
  end

  def self.get_corner_options(grid)
    corners = [0,2,6,8]
    available_corners = corners.select { |tile| grid[tile].nil? }
  end

  def self.get_next_move(grid, options, marker)
    next_move = nil
    options.each do |option|
      if winning_move?(option, grid, marker)
        next_move = option
        break
      end
    end
    next_move
  end

  def self.sort_options_by_frequency(options)
    option_frequency = Hash.new { |h,k| h[k] = 0 }
    options.each do |option|
      option_frequency[option] += 1
    end
    sorted_options_by_frequency = option_frequency.sort_by { |option, frequency| frequency }.reverse
    sorted_options = sorted_options_by_frequency.map { |option_data| option_data[0] }
    sorted_options
  end

  def self.winning_move?(tile_index,grid, marker)
    grid_copy = Array.new(grid)
    old_val = grid_copy[tile_index]
    grid_copy[tile_index] = marker
    temp_board = Board.new(grid_copy)
    return temp_board.is_winner?(marker)
  end

end
