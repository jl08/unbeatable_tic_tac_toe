class Board
  attr_reader :grid

  def initialize(board = nil)
    @grid =  board || Array.new(9)
  end

  def has_row_match?(marker)
    first_column = [0,3,6]
    has_three_consecutive_match?(marker,first_column,1,2)
  end

  def has_vertical_match?(marker)
    first_row = [0,1,2]
    has_three_consecutive_match?(marker,first_row,3,6)
  end

  def has_three_consecutive_match?(marker,tiles_to_check, second_tile_index_incrementor, third_tile_index_incrementor )
    three_matching = false
    tiles_to_check.each do |tile|
      if grid[tile] == marker && grid[tile + second_tile_index_incrementor] == marker && grid[tile + third_tile_index_incrementor] == marker
        three_matching = true
        break
      end
    end
    three_matching
  end

  def has_diagonal_match?(marker)
    if grid[0] == marker && grid[0] == grid[4] && grid[0] == grid[8]
      return true
    end
    false
  end

  def has_other_diagonal_match?(marker)
    if grid[2] == marker && grid[2] == grid[4] && grid[2] == grid[6]
      return true
    end
    false
  end

  def is_full?
    !grid.include?(nil)
  end

  def is_winner?(marker)
    if marker.nil?
      return false
    end
    if has_row_match?(marker) || has_vertical_match?(marker) || has_diagonal_match?(marker) || has_other_diagonal_match?(marker)
      return true
    end
    false
  end

  def remaining_options
    options = []
    grid.each_with_index do |tile, position|
      if tile.nil?
        options << position
      end
    end
    options
  end

  def update(position, marker)
    if !position.nil?
     grid[position.to_i] = marker
   end
  end

end
